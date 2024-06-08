## Features

- Custom zombie spawning and despawning logic.
- Looting system with configurable probabilities for different loot types.
- Safe zones where players are protected from zombies.
- Custom UI for notifications and interactions.
- Player death handling with a 20-minute item retrieval period.
- Configurable settings through a separate `config.lua` file.

## Project Structure

esx_custom_zombies/
│
├── config.lua
├── fxmanifest.lua
├── locales/
│ ├── en.lua
│ ├── fr.lua
│ └── es.lua
│
├── server/
│ ├── main.lua
│ ├── events.lua
│ └── functions.lua
│
├── client/
│ ├── main.lua
│ ├── events.lua
│ └── functions.lua
│
└── html/
├── ui.html
├── css/
│ └── styles.css
└── js/
└── scripts.js

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.