# telegram-send-group-topic

Scripts to send message notifications and files using Telegram - specifically to a previously configured Telegram bot with a group topic.

## Usage

```text
Usage: telegram-send "Your message here"

Usage: telegram-send-group-topic.sh "Your message here" "The Topic ID here (optional)"

Usage: telegram-send-group-topic-file.sh "Your message here" "The Topic ID here" "The File and path here"
```

## Prerequisites

Telegram bot set up on your account and a group and topic created.

## Getting Started

1. **Install the scripts:**
	```bash
	cd ~
	mkdir -p Installs
	cd Installs
    mkdir -p telegram
    cd telegram
    wget https://raw.githubusercontent.com/tsqrdster/telegram-send-group-topic/main/telegram-send.sh
    wget https://raw.githubusercontent.com/tsqrdster/telegram-send-group-topic/main/telegram-send-group-topic.sh
    wget https://raw.githubusercontent.com/tsqrdster/telegram-send-group-topic/main/telegram-send-group-topic-file.sh
    wget https://raw.githubusercontent.com/tsqrdster/telegram-send-group-topic/main/telegram-send.conf.example
    chmod +x *.sh
    # CHANGE BELOW - for your user home folder (/home/<username>/)
    sudo ln -s /home/pi/Installs/telegram/telegram-send.sh /usr/local/bin/telegram-send
    sudo ln -s /home/pi/Installs/telegram/telegram-send-group-topic.sh /usr/local/bin/telegram-send-group-topic.sh
    sudo ln -s /home/pi/Installs/telegram/telegram-send-group-topic-file.sh /usr/local/bin/telegram-send-group-topic-file.sh
    ```

2. **Configure:**
Edit your .conf file and set your Telegram bot token and chat ID.
    ```bash
	cp telegram-send.conf.example telegram-send.conf
	nano telegram-send.conf
	# make changes by inserting your Bot Token and Chat ID (removing the <>s ) then save with  <ctrl>+o <enter> then exit  with  <ctrl>+x
    ``` 

## License ##
This project is licensed under the MIT License - see the LICENSE file for details.
	
## Contributing ##

If you find a bug please create an issue for it. Feel free to submit Pull Requests or open Issues if you find a bug or have ideas for new features!