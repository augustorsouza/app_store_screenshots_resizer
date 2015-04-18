# App Store Screenshot Resizer

A command line tool made in elixir to help creating screenshots for the App Store

## Installing Dependencies
1. Install Elixir using Homebrew

		brew install elixir

2. Install Imagemagick

		brew install imagemagick
		
3. Git clone this repo

		git clone https://github.com/augustorsouza/app_store_screenshots_resizer.git
		
4. Enter the cloned repo directory and install dependencies with mix
		
		cd app_store_screenshots_resizer
		mix do deps.get, deps.compile

## How to build

1. Git clone this repo
		
		git clone https://github.com/augustorsouza/app_store_screenshots_resizer.git

2. Enter the cloned repo directory and install dependencies with mix
		
		cd app_store_screenshots_resizer
		mix do deps.get, deps.compile

3. Build the executable with mix
		
		mix escript.build

## How to use

1. Git clone this repo
		
		git clone https://github.com/augustorsouza/app_store_screenshots_resizer.git

2. Enter the cloned repo directory
		
		cd app_store_screenshots_resizer
		
3. Run the executable passing a --dir parameter that must point to the directory where you put the 5.5-inch size png images, it will be generated a directory for each necessary iphone screenshot in the App Store containing the corresponding JPGs in the correct resolution

		./app_store_screenshots_resizer --dir /path/to/a/dir/with/your/5.5-inch/screenshots/in/png
