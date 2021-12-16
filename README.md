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

- MetaMask browser extension met een account. Om zeker te zijn dat je niet perongeluk met echte ether gaat werken is een test account aan te raden.
- Een code editor (bijvoorbeeld: Visual studio code: https://code.visualstudio.com/download).
  - Optioneel: Solidity extension in Visual Studio Code.
    - Zoek "juanblanco.solidity" op in de visual studio market place in visual studio code.
- Python: https://www.python.org/downloads/
  - Dit heb je nodig om WEB3 scripts te runnen
- Pipx: Dit is de aanbevolen installen om brownie te installeren: https://github.com/pypa/pipx
- Brownie: Dit is het token framework wat gebruikt is voor dit template. Dit framework automatiseert het compilen waardoor dat niet meer handmatig gecodeerd hoeft te worden: https://eth-brownie.readthedocs.io/en/stable/install.html

// TODO expand on this

## Hoe je eigen token te deployen? (Ropsten testnet)

Maak in de hoofdfolder een bestand aan met de naam: ".env". Zet hier vervolgens je private key in van ROPSTEN testnetwerk in je metamask (https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
Dat ziet er dan als volgt uit:

```solidity
export ROPSTEN_PRIVATE_KEY=<YOUR ROPSTEN PRIVATE KEY>
```

Met jouw persoonlijk prive sleutel tussen de <>.

Verander in het "token.sol" de tekst tussen "" naar een naam (lijn 7) en afkorting (lijn 8).

Open een terminal en run:

```solidity
brownie compile
```

Dit zorgt dat alle nodige dependencies gedownload kunnen worden en dat de code kan compilen.

Wanneer het compilen successvol is gelukt zou het token contract deployable moeten zijn. Om te voorkomen dat het misschien fout gaat is het script ook eerst lokaal te runnen. In dat geval zal brownie de ganache-cli op spinnen. Het is dan niet mogelijk om met het contract te werken, want dat zou dan vooraf geprogrameerd moeten worden, maar dan is in ieder geval duidleijk dat het contract lokaal te deployen is.

Dit is te doen met het volgende commando:

```solidity
brownie run scripts/1_deploy_token.py
```

Als alles daar werkt en u bent tevreden met uw token kunt u het deployen naar het ropsten testnet door middel van het commando:

```solidity
brownie run scripts/1_deploy_token.py --network ropsten
```
