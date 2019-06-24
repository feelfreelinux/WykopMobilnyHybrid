<img src="https://i.imgur.com/jbbqqRq.png" height="33%" width="33%"/><img src="https://i.imgur.com/nNt0ZEN.png" height="33%" width="33%"/><img src="https://i.imgur.com/IbIz1CT.png" height="33%" width="33%"/>

# Wykop Mobilny (Hybird)

Flutter port of [WykopMobilny](https://github.com/feelfreelinux/WykopMobilny)

# Setting up

1. Requirements:
    - For this app you need to install [flutter](https://flutter.io/docs/get-started/install).

2. Setup:
    - Enter `/assets/` folder and create file named `secrets.json`.
    - Copy code from `secrets.example.json`.
    - Replace `wykop_key` and `wykop_secret` with your keys.

        *you can generate keys [here](https://www.wykop.pl/dla-programistow/nowa-aplikacja/)*

        ***Keep in mind, that application uses API version 2. Version 1 keys are not supported and will not work.***

3. Install all depedencies:
    - flutter packages get

4. After successful installation, you can run the app by typing in terminal:
    - flutter run

        *if you want to run production version just type*
    - flutter run --release

If you have any issues join [Polish Flutter](https://discord.gg/Uw6VAcD) server on discord or [Otwarty Wykop Mobilny](https://discord.gg/WgQZJD3) discord.

*[Flutter developers](https://discordapp.com/invite/N7Yshp4) server on discord.*
