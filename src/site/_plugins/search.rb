class AlgoliaSearchJekyllPush < Jekyll::Command
  class << self
    # Hook to exclude some files from indexing
    def custom_hook_excluded_file?(file)
      should_exclude = file.path =~ %r{^docs/latest/.*/}
      # if should_exclude
      #   printf "exclude file: %s\n", file.path
      # else
      #   printf "include file: %s\n", file.path
      # end
      should_exclude
    end
  end
end