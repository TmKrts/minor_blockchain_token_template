# Minor blockchain token template

Dit is de codebase om een token te deployen op een testnet. Deze github bestaat uit het volgende:

- Contract:
  - Token.sol die een token maakt vanuit de ERC20 standaard met een naam en afkorting.
- Scripts:
  - 1_deploy_token.py: hierin wordt de "initial supply" van de token gezet en wordt het token gedeployed.
  - helpful_scripts.py: hierin wordt na gerefereeerd vanuit het "1_deploy_token_script.py" bestand om het juiste account op te halen op basis van hoe de gebruiker wil deployen. Bijvoorbeeld lokaal ganache account of testnet account.
- brownie-config.yaml: hierin worden externe packages vermeld zodat iedereen gebruikt maakt van dezelfde packages en versies. Daarnaast wordt ook verwezen naar een file met persoonlijke gegeven. Hierover verderop meer.

## Vereisten:

Om deze code zelf te runnen moet je het volgende gedownload hebben:

- Een code editor (bijvoorbeeld: Visual studio code: https://code.visualstudio.com/download).
  - Optioneel: Solidity extension in Visual Studio Code.
    - Zoek "juanblanco.solidity" op in de visual studio market place in visual studio code.
- Python: https://www.python.org/downloads/
  - Dit heb je nodig om WEB3 scripts te runnen
