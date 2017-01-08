module BuildNotifications
  class HgRepoHelper

    def initialize(repo_path)
      @repo_path = repo_path
      @hg = "/usr/bin/hg"
      @rm = "/bin/rm"
      @touch = "/usr/bin/touch"
      @mkdir = "/bin/mkdir"
    end

    def create_repo()
      `#{rm} -rf #{repo_path}`
      `#{mkdir} -p #{repo_path}`
      `(cd #{repo_path}; #{hg} init)`
    end

    def create_commit()
      filename = SecureRandom.uuid.to_s
      `(cd #{repo_path}; #{touch} #{filename})`
      `(cd #{repo_path}; #{hg} add #{filename})`
      `(cd #{repo_path}; #{hg} commit -m "Commit #{filename}")`
      hash = `(cd #{repo_path}; #{hg} --debug id --id)`
      hash.strip!
      hash
    end

    attr_reader :repo_path, :hg

    private
    attr_reader :rm, :touch, :mkdir

  end
end