## Factsheet
In deze factsheet tabel laat ik zien wat ik allemaal heb gedaan voor dit project.
De tabel is opgedeeld in meerdere kolommen.
In de kolom competentie vertel ik over welke competentie het gaat.
In de kolom Bijdrage laat ik met Jira taken, linken naar de diffs en commits zien wat ik heb gedaan.
In de beschrijving eigen bijdragen leg ik mijn bijdrage uit.
In de bijdrage kolom zijn er linken het belangrijkst de Jira taken zijn handig voor als je wilt zien wat de taak inhoudt. 

<table>
    <theader>
        <tr>
            <th>
                Competentie
            </th>
            <th>
                Bijdrage
            </th>
            <th>
                Beschrijving eigen bijdragen
            </th>
        </tr>
    </theader>
        <tr>
            <td>
                <strong>ISEP-01.</strong> 
                Je richt op grond van de gekozen ontwikkelmethodiek een software ontwikkeltraject projectmatig in en voert het uit, kiest geschikte methoden en technieken en past deze toe.
                Je bewaakt de voortgang van het project en stelt de planning indien nodig bij.  
            </td>
            <td>
                <a href="https://jira.aimsites.nl/secure/RapidBoard.jspa?projectKey=ISES2A4&rapidView=1506"> Jira bord</a> <br>
                <a href="http://www.rupopmaat.nl/index.html">RUP</a> <br>
                <a href="https://jira.aimsites.nl/browse/ISES2A4-151">Jira taak met DoD onderdelen in de comments</a><br>
            </td>
            <td>
                Wij moesten van de HAN de ontwikkelmethode RUP toepassen.
                Wij hebben zelf besloten om een Jira-bord te maken en in sprints/iteraties te werken.
                Zo hebben wij gewerkt in een initiatie-, elaboratie-, uitgebreide elaboratie-, twee constructie- en een transitie-fase.
                Ik heb het projectproces goed proberen toe te passen door aan het begin van elke sprint samen met mijn team de sprint in te plannen.
                Vervolgens hebben wij taken toegewezen en uitgevoerd.
                Wanneer een taak klaar was, zette ik deze op "ready for review" met in de comments de onderdelen van het DoD (Definition of Done).
                De voltooide onderdelen markeerde ik met een kruisje.
                Als een taak feedback kreeg, verwerkte ik de feedback; anders ging ik verder.
                Als ik een taak had afgerond, reviewde ik een taak van een teamgenoot zodat er meer taken op "done" gezet konden worden.
            </td>
        </tr>
        <tr>
            <td>
                <strong>ISEP-02.</strong>
                Je maakt een analyse van de eisen en wensen voor een informatiesysteem en stelt op basis van deze analyse een dynamisch model en een statisch model (d.w.z. conceptueel datamodel inclusief business rules) op en documenteert deze in een functioneel ontwerp.
            </td>
            <td>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/commits/615703cb758147271351837f2e684a92c44331e4">Bitbucket Analyse van bijlage D</a><br>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/commits/20ae7f4c2bca682ee223adf9113a448bd22bb97a#doc/FO.md">Bitbucket Aanpassingen aan de verwoordingen van bijlage D</a> <br>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/compare/commits?sourceBranch=refs%2Fheads%2Ffeature%2FISES2A4-139-toevoegen-race-uitslagen&targetBranch=refs%2Fheads%2Fmaster"> Bitbucket branch 139 toevoegen-race-uitslagen </a>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/pull-requests/24/diff#code%2Fscripts%2FTR_deelnemendeCoureurOuderDanVijftien.sql">Bitbucket branch 181 feedback verwerken</a>
            </td>
            <td>
                In de Bitbucket push "bijlage D geanalyseerd" heb ik de verwoordingen van bijlage D afgemaakt en verbeterd.
                Vervolgens heb ik de verwoordingen omgezet naar een CDM, daarna het CDM naar een PDM en als laatst het PDM naar de database create script.
                <br>
                In de Bitbucket push "Aanpassingen aan de verwoordingen van bijlage D" was ik begonnen aan het FO.
                Ik heb de functionele eisen samen met Dylano gemaakt en toegevoegd aan het FO.
                Ook heb ik het domains model gemaakt.
                <br>
                In de Bitbucket branch "139 toevoegen race-uitslagen" staan drie verschillende kleine commits waarin ik het attribuut aantalLaps toevoeg aan de tabel race en het attribuut volgnummer toevoeg aan de tabel deelnemendeCoureur.
                Ik heb voor deze twee nieuwe attribute nieuwe verwoordingen geschreven in het FO en ze in het CDM en PDM gezet.
                <br>
                In de Bitbucket branch "181 feedback verwerken" heb ik de business rules uitgewerkt en de constrains in het FO.
                Ook heb ik twee triggers geschreven voor de business rules en unittest voor de triggers.
            </td>
        </tr>
        <tr>
            <td>
                <strong>ISEP-03.</strong>
                Je stelt een technisch ontwerp op voor het te ontwikkelen informatiesysteem dat consistent is met het functioneel ontwerp en motiveert de ontwerpbeslissingen in relatie tot met de requirements. 
            </td>
            <td>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/commits/20ae7f4c2bca682ee223adf9113a448bd22bb97a#doc/FO.md">Bitbucket Aanpassingen aan de verwoordingen van bijlage D</a><br>      
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/pull-requests/24/diff#doc%2FTO.md">Bitbucket 181 feedback verwerken TO Integrity Rules</a><br>
            </td>
            <td>
                In de Bitbucket push "Aanpassingen aan de verwoordingen van bijlage D" heb ik het PDM gegenereerd voor het TO.<br>
                In de Bitbucket branch "181 feedback verwerken" staat erin het TO de integrity Rules die ik heb uitgewerkt met daaronder een onderbouwing waarom ik ze zo heb uitgewerkt.
            </td>
        </tr>
        <tr>
            <td>
            <strong>ISEP-04.</strong> 
            Je bewaakt continu de kwaliteit van het ontwerp en van het te ontwikkelen systeem. 
            </td>
            <td>
                <a href="https://jira.aimsites.nl/browse/ISES2A4-23">Jira taak 23 Analyseren Bijlage A</a><br>
                <a href="https://jira.aimsites.nl/projects/ISES2A4/issues/ISES2A4-24?filter=allissues">Jira taak 24 Analyseren Bijlage B</a><br>
                <a href="https://jira.aimsites.nl/browse/ISES2A4-176">Jira taak met feedback en DoD onderdeel in de comments</a><br>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/commits/d46bf01a5fb4c90bf856bc1116047adb5858313f#code/scripts/unittest.sql">Unittest voor de SP addDeelnemendeCoureur en addLap</a>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/commits/a113b017cd5f7431d4bc595048a646ea8ea0a48a#doc/DoDAangepast.md">DoD aanpassingen Bitbucket</a>
            </td>
            <td>
                Bij <strong>Jira taak 23</strong> Analyseren bijlage A heb ik de verwoordingen van Dylano gereviewd en feedback opgeven in de comment van de Jira taak.<br>
                Bij <strong>Jira taak 24</strong> Analyseren bijlage B heb ik de feedback verwerkt van Dylano zoals je kan zien in de comments.<br>
                Bij <strong>Jira-taak 176</strong> heb ik de taak van Simon gereviewd, waarin hij de tussentijdse feedback van het FO had verwerkt.
                Ik heb de bijbehorende onderdelen van het DoD ernaast gehouden en de zaken die hij wel had gemarkeerd.
                De ontbrekende zaken heb ik open gelaten.
                Vervolgens heb ik hem nog extra feedback gegeven over zaken die mij opvielen, maar niet bij het DoD hoorden. <br>
                Om de kwaliteit te bewaken heb ik unittest geschreven voor de stored procedures addLap en addDeelnemendeCoureur die onder de use case toevoegen Race Uitslagen. <br>
                Toen ik doorhad dat het DoD op sommige onderdelen nog onduidelijk was en niet SMART, heb ik het volledig doorgenomen en waar nodig aanpassingen gemaakt.
                Dit heb ik gedaan zodat wij het DoD beter konden gebruiken tijdens het reviewen, waardoor het proces beter zou verlopen en de kwaliteit zou toenemen.
                De aanpassingen die ik heb gemaakt, kun je zien in de Bitbucket-push.
            </td>
        </tr>
        <tr>
            <td>
            <strong>ISEP-05.</strong>
            Je implementeert in teamverband het informatiesysteem in overeenstemming met het ontwerp ervan, zorgt voor traceerbaarheid tussen ontwerp en implementatie en motiveert eventuele afwijkingen.
            </td>
            <td>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/commits/56b57081248e1018fa2b3c1fbed4905b446b0280?to=387e601e80f322218637c1b5c8de2cdc4b1bb446#code/scripts/SP_addRaceResults.sql">Bitbucket branch ISES2A4-139-toevoegen-race-uitslagen</a><br>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/compare/commits?targetBranch=refs%2Fheads%2Ffeature%2FISES2A4-139-toevoegen-race-uitslagen&sourceBranch=refs%2Fheads%2Ffeature%2FISES2A4-144-updaten-race-uitslagen&targetRepoId=3950">Bitbucket Branch feature/ISES2A4-144-updaten-race-uitslagen</a><br>
                <a href="https://bitbucket.aimsites.nl/projects/ISES2A4/repos/code/compare/diff?sourceBranch=refs%2Fheads%2Ffeature%2FISES2A4-181-feedback-verwerken&targetRepoId=3950">Bitbucket branch 181-feedback-verwerken</a>
            </td>
            <td>
                In de Bitbucket branch "ISES2A4-139-toevoegen-race-uitslagen" heb ik de twee procedure SP_addLap en SP_addDeelnemendeCoureur en de bijbehorende unittest gemaakt. <br>
                In de Bitbucket branch "Branchfeature/ISES2A4-144-updaten-race-uitslagen" heb ik de procedures SP_updateLap em SP_updateDeelnemendeCoureur gemaakt.
                Hierin heb ik ook gebruik gemaakt van de school template.<br>
                In de Bitbucket branch "181-feedback-verwerken" heb ik de triggers TR_deelnemendeCoureurOuderDanVijftien en TR_volgnummerUnique gemaakt gebaseerd op de Integrity Rules die ik in het TO zelf heb gemaakt.
                Ook heb unittest geschreven voor deze rules volgens ons testplan. 
            </td>
        </tr>
        <tr>
            <td>
            <strong>ISEP-06.</strong>
            Je draagt bij aan het goed functioneren van het ontwikkelteam en ondersteunt de leden van het team bij hun taakuitoefening. 
            </td>
            <td>
            </td>
            <td>
                Als feedback had ik ontvangen dat ik sneller om hulp moest vragen wanneer ik vastliep en pauzes moet nemen op de daarvoor bestemde tijden.
                Ik probeer deze feedback toe te passen door een vaste tijd te bepalen waarna ik om hulp vraag als ik vastloop.
                Mijn sterke punten waren mijn procesmatige werkwijze.
                Aangezien zij vinden dat ik daar goed in was ben ik ook actiever een rol gaan spelen in het proces om de rest van het team te helpen. 
                Ik herinner het team eraan het DoD (Definition of Done) te gebruiken tijdens het uitvoeren en beoordelen van taken, en zorg ervoor dat we aan het begin van een sprint samen het Jira-bord opzetten.
                Daarnaast geef ik bij elke IPF feedback aan mijn teamgenoten om het groepsproces te verbeteren.
            </td>
        </tr>
        <tr>
            <td>
            <strong>ISEP-07.</strong>
            Je verdiept je zelfstandig verder in de beroepstaak.
            </td>
            <td>
            </td>
            <td>
                In mijn Bijlage mapje kun je in het bestand STARTT Reflectie Jannis Geerts alle acties vinden die ik heb genomen voor mijn leerdoelen.
                In mijn projectverslag kun je vinden hoe ik mij heb verdiept in het project en wat ik heb geleerd van mijn leerdoelen tijdens dit project.
                <br>
                Daarnaast wist ik niet goed wat een API was en hoe dit in elkaar zit.
                Ik heb mij hierin samen met Dylano verdiept.
                Hij heeft mij uitgelegd hoe de API in elkaar zat en wat het dee.
                <br>
                Ik ben beter geworden in concurrency.
                Eerst had ik een heel vaag concept van concurrency en wist ik niet wanneer ik het moest toepassen.
                Tijdens dit project heb ik meerdere keren uitleg gekregen van de process begeleider die heeft gezegd waarom wij concurrency toepassen en wanneer.
                Ook hebben wij samen met het team de school template doorgekeken om hem te begrijpen.
                Hierdoor heb ik een beter beeld gekregen van concurrency, wanneer je het wil toepassen en hoe je het mogelijk moet maken om toe te passen.
            </td>
        </tr>
</table>
