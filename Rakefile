task :compile do
  system("rm output -rf")
  system("npm run-script build && bundle exec nanoc compile")
end

task :deploy do
  system("rm output -rf")
  system("git clone https://github.com/siddick/siddick.github.com output")
  system("rm output/* -r")
  system("npm run-script build && bundle exec nanoc compile")
  Dir.chdir("output") do
      system("git add -A")
      system("git commit -m 'Deploy new content' && git push origin")
  end
end

task :default => :compile
