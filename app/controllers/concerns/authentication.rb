# frozen_string_literal: true
concern :Authentication do
  included do
    helper_method :sign_in_accounts, :sign_in_groups,
                  :current_group, :current_account,
                  :sign_in_any?

    private

    def authenticate!
      initial_session_data
      return unless group_slug

      cs = session_for(group_slug)

      if cs&.group.member?(cs.account)
        session[:current_session] = session_index_for(group_slug)
      else
        sign_out(cs)
        redirect_to new_session_path
      end
    end

    def initial_session_data
      session[:sessions] ||= []
      session[:current_session] ||= -1
    end

    def sign_in(s)
      return if signed_in?(s)

      session[:sessions] << {
        'account' => s.account.id,
        'group_slug' => s.group.slug
      }
      session[:current_session] = session[:sessions].size - 1

      # clear cache
      @sign_in_sessions = nil
      @sign_in_accounts = nil
      @sign_in_groups = nil
    end

    def sign_out(s)
      session[:sessions].delete_if { |g| g['group_slug'] == s.group.slug }

      if session[:current_session].to_i >= session[:sessions].size
        session[:current_session] = session[:sessions].size - 1
      end

      # clear cache
      @sign_in_sessions = nil
      @sign_in_accounts = nil
      @sign_in_groups = nil
    end

    def sign_in_any?
      session[:sessions].present?
    end

    def signed_in?(s)
      sign_in_groups.include?(s.group)
    end

    def sign_in_sessions
      @sign_in_sessions ||= session[:sessions].map do |s|
        Session.new(
          account: Account.find_by(id: s['account']),
          group: Group.find_by(slug: s['group_slug'])
        )
      end
    end

    def sign_in_accounts
      @sign_in_accounts ||= sign_in_sessions.map(&:account)
    end

    def sign_in_groups
      @sign_in_groups ||= sign_in_sessions.map(&:group)
    end

    def current_account
      current_session&.account
    end

    def current_session_index
      session[:current_session].to_i
    end

    def current_group
      current_session&.group
    end

    def current_session
      sign_in_sessions[current_session_index]
    end

    def session_index_for(group_slug)
      sign_in_sessions.index { |s| s.group.slug == group_slug }.to_i
    end

    def session_for(group_slug)
      sign_in_sessions[session_index_for(group_slug)]
    end
  end
end
