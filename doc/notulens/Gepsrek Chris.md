Met Chris bespreken hoe wij de CRUD usecases gaan uitwerken in fully dressed. <br>
1 Werken de CRUD usecases niet uit. <br>
2 Zetten de Create van CRUD in de main succes scenario en werken de rest af in de alternative flows. <br>
3 Werken alleen de Create van CRUD uit. <br>

Met Chris moeten wij bespreken of degene die de taak maakt ook het DOD onderdeel moet opslaan in de taak met wat je hebt gedaan. <br>

Navragen of de generate code die wij nu hebben goed is. <br>

Hoe maak jij de code documentatie onderdeel in het DOD meer SMART? <br>
Hoe maak je het nuttige testen van een stuk code SMART? <br>
Meer dingen waar de code documentatie moet aan voldoen. <br>


Wat wordt hiermee bedoeld:
- Het architectuur model: iets functioneels of een onderbouwde keuze gemaakt om functionele en niet functionele eisen te kunnen realiseren? Dus iets voor TO? Model toont ook in de boxjes dingen die nietszeggend zijn. <br>
- Het UC model: wat is nu het systeem (zijn dat er nu twee, kort door de bocht de relationele db en de mongo db). Waarom dit model met louter lees en voeg toe van een selecte set van entiteiten? Hebben jullie een gerichte informatie vraag van de opdrachtgever als vertrekpunt genomen om enerzijds je prototype op te baseren en anderzijds de relationele kant daarbij te ontwikkelen als iteratie1/start increment? Komen de update en delete aspecten er later nog bij? <br>
- Use cases: de use case uitlezen uitslagen van races stelt dat de API de data verzamelt. Dat riekt naar een API die zelf de JSON maakt uit data die de API opvraagt van de relationele database. Is dat het geval in jullie oplossing (de API vertaalt - met een d - het verzoek naar een SQL verzoek)?

Wat wordt er bedoeld met kwaliteitsbewaking en een testscenario's?

# testraport vanuit TO revereren

Usecases alleen klein discription geven.

Bij update en insert, als business rules specifiek voor iets zijn wilt hij zien in FO.

Usecase verhaal langs jorg brengen zodat we zeker weten dat we wel een fully dressed usecase zit. 
Vraag ook of hij een idee heeft om te komen met een proces.

Testen testen het format we hebben staan in het technisch ontwerp

