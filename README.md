JRuby Sinatra app (deployable to Heroku) for jieba-jruby
=======

[jieba-jruby](https://github.com/mimosa/jieba-jruby) is a Chinese NLP tool.

Instructions
-----------

**Check this code out from github.**  
`$ git clone git://github.com/diasks2/jieba-heroku.git`  

**Go into the project directory and run:**  
`$ jruby -S gem install bundler heroku`  

**Generate your Gemfile.lock and load dependencies:**  
`$ jruby -S bundle install`  

**Duplicate the Gemfile to Jemfile so that heroku knows its a JRuby app.**  
`$ cp Gemfile Jemfile`  
`$ cp Gemfile.lock Jemfile.lock`  

**Initialise GIT**  
`$ git init`  
`$ git add .`  
`$ git commit -m "Initial commit"`  

**Initialise and push to Heroku (with cedar stack for java) this will give you the application URL (can be renamed by logging in to heroku.com)**  
`$ heroku create --stack cedar --buildpack http://github.com/heroku/heroku-buildpack-java.git`  
`$ git push heroku master`  

**Set your KEY environmental variable on Heroku**  
`$ heroku config:set KEY=yourKey`  

Other useful commands
-----------

Start local server: `$ rackup`  

If consuming the response in another ruby or rails app you may need to do something like the following:
```ruby
response = CurbFu.post('http://your-app.herokuapp.com', { :text => your_text, :key => 'yourKey' })  
response.body.force_encoding("utf-8").scan(/\"([^\""]*)\"/).flatten
```
