## Messages

# - > +
message("Good job on cleaning the code 👏") if git.deletions > git.insertions

## Failures

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
  fail('Please rebase to get rid of the merge commits in this PR 💣')
end

## Warnings

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress 👷") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn "Big PR 🐘, consider splitting into smaller" if git.lines_of_code > 500

# Check for Pull Request description
warn 'Please mark all the checkboxes.' if github.pr_body.include? '- [ ]'

# Warn if there's no description
warn("Please, provide a description to your PR 📝") if github.pr_body.length < 5

# If these are all empty something has gone wrong, better to raise it in a comment
if git.modified_files.empty? && git.added_files.empty? && git.deleted_files.empty?
  fail "This PR has no changes at all, this is likely an issue during development. 🙊"
end

# Leave warning, if Podfile changes
if podfile_updated
  warn "The `Podfile` was updated"
end

# This is swiftlint plugin. More info: https://github.com/ashfurrow/danger-swiftlint
#
# This lints all Swift files and leave comments in PR if 
# there is any issue with linting
swiftlint.lint_files
swiftlint.lint_files inline_mode: true