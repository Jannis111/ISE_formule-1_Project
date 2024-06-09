## Oordeel kwaliteit: technisch ontwerp Jannis Geerts
De keuring wordt met O, V of G beoordeeld.
- O: Onvoldoende, het voldoet niet aan alle eisen en of is niet volledig uitgewerkt
- V: Voldoet aan de opgestelde beschrijving maar mist inhoudelijk context
- G: goed, voldoet aan de opgestelde beschrijving en heeft inhoud waarop verder gebouwd kan worden.

## DoD technisch ontwerp producten/kwaliteitseisen
<table>
    <tr>
        <th>
            Kwaliteit onderdeel
        </th>
        <th>
            Kwaliteitscriteria
        </th>
        <th>
            Keuring
        </th>
        <th>
            Argument
        </th>
    </tr>
    <tr>
        <td>
            Algemeen proces
        </td>
        <td>
            <li>Het document is beoordeeld en goedgekeurd door minstens één teamlid.</li>
            <li>Alle onderdelen zijn aan een expert voorgelegd voor goedkeuring en feedback.</li>
        </td>
        <td>
            V
        </td>
        <td>
           Ik vind het algemeen proces voldoende aangezien elke onderdeel van het TO door één teamgenoot is gereviewd, maar naar mijn mening hadden wij wel wat vaker het TO mogen laten controleren door de opdrachtgever of expert. 
        </td>
    </tr>
    <tr>
        <td>
            Architectuur ontwerp
        </td>
        <td>
            <li>Het architectuurontwerp voldoet aan de uml regelgeving.</li>
            <li>Het architectuurontwerp bevat alle subsystemen die ons systeem gaat gebruiken.</li>
            <li>Het architectuurontwerp bevat een uitleg die duidelijkheid geeft over wat er in staat.</li>
            <li>Het architectuurontwerp is beoordeeld en goedgekeurd door minstens één teamlid.</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind het architectuurontwerp goed, omdat het een kort maar duidelijke omschrijving heeft over wat elke onderdeel in het architectuur ontwerp doet, het is door twee mensen gereviewd, het bevat alle subsystemen en het voldoet aan de uml regelgeving.
        </td>
    </tr>
    <tr>
        <td>
            PDM
        </td>
        <td>
            <li>Het fysieke datamodel (PDM) is compleet en nauwkeurig.</li>
            <li>Het PDM is beoordeeld en goedgekeurd door minstens één teamlid.</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind het PDM goed aangezien het compleet en nauwkeurig is en het is ook door twee mensen gereviewd.
        </td>
    </tr>
    <tr>
        <td>
            Integriteitsregels
        </td>
        <td>
            <li>Alle integriteitsregels zijn gedefinieerd en gedocumenteerd.</li>
            <li>Alle integriteitsregels zijn onderbouwd met redenen voor hun bestaan.</li>
            <li>De integriteitsregels zijn beoordeeld en goedgekeurd door minstens één teamlid.</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind de integriteitsregels goed, omdat ze gereviewd zijn door minimaal één teamlid, onderbouwt zijn voor de reden van hun bestaan, de opbouw hebben zoals moest in DMDD en doordat ze met de opdrachtgever zijn besproken. 
        </td>
    </tr>
    <tr>
        <td>
            Datatypes/domeinen
        </td>
        <td>
            <li>Alle datatypen en domeinen zijn gedefinieerd en gedocumenteerd.</li>
            <li>Voor elke datatype is er een uitleg waarom juist dat datatype is gekozen.</li>
            <li>De datatypen en domeinen zijn beoordeeld en goedgekeurd door minstens één teamlid.</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind de datatypes/domeinen goed, omdat alle datatypen en domeinen van het CDM/PDM gedocumenteerd in een overzichtelijke table met een onderbouwing waarom dat datatype is gekozen en het is minimaal door één teamlid gereviewd.
        </td>
    </tr>
    <tr>
        <td>
            Indexen
        </td>
        <td>
            <li>Alle indexen zijn gedefinieerd en gedocumenteerd.</li>
            <li>De indexen zijn beoordeeld en goedgekeurd door minstens twee teamleden.</li>
            <li>Indexen zijn aangemaakt.</li>
            <li>Indexen zijn gecontroleerd.</li>
            <li>Indexen zijn geoptimaliseerd.</li>
            <li>Indexen zorgen voor verbetering in de snelheid van de query.</li>
        </td>
        <td>
            V
        </td>
        <td>
            Ik vind de Indexen voldoende, omdat wij niet zoveel indexen hebben, maar als wij ze hebben wij ze gedocumenteerd.
        </td>
    </tr>
    <tr>
        <td>
            Create scripten
        </td>
        <td>
            <li>Is traceerbaar vanaf het PDM.</li>
            <li>Is hufterproef.</li>
            <li>Bevat een create statement.</li>
            <li>Bevat een drop tabel if exists.</li>
            <li>Bevat keys.</li>
            <li>Bevat cascading.</li>
        </td>
        <td>
            V
        </td>
        <td>
            Ik vind het create script voldoende, omdat het goed traceerbaar is vanaf het PDM, keys bevat en simpel te gebruiken is.
            Het ontbreekt alleen cascading en daardoor vind ik het een voldoende en niet een goed.
        </td>
    </tr>
    <tr>
        <td>
            Stored procedures
        </td>
        <td>
            <li>Gebruiken SP voor de naam.</li>
        </td>
        <td>
            O
        </td>
        <td>
            Ik vind dat de stored procedures in het TO onvoldoende zijn, omdat er geen procedures zijn gedocumenteerd in het TO. 
        </td>
    </tr>
    <tr>
        <td>
            Triggers
        </td>
        <td>
            <li>Gebruiken nocount.</li>
            <li>Gebruiken Tr voor de naam.</li>
        </td>
        <td>
            O
        </td>
        <td>
            Ik vind deze onvoldoend, omdat er geen triggers zijn gedocumenteerd in het TO.
        </td>
    </tr>
    <tr>
        <td>
            Code documentatie
        </td>
        <td>
            <li>Als de werking van een stored procedure lastig te begrijpen is moet deze gedocumenteerd zijn.</li>
            <li>Wanneer een stored procedure gebruik maakt van een andere stored procedure moet dit gedocumenteerd worden.</li>
            <li>Als de werking van een trigger lastig te begrijpen is moet deze gedocumenteerd zijn.</li>
            <li>Wanneer een trigger gebruik maakt van een andere stored procedure moet dit gedocumenteerd worden.</li>
            <li>Ingewikkelde onderdelen van de API zijn gedocumenteerd.</li>
            <li>Wanneer de stored procedure meerdere tabellen aanraakt moet deze gedocumenteerd worden.</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind de code documentatie goed, omdat wanneer een stored procedure of trigger lastig te begrijpen is of gebruikt maakt van een andere store procedure of meerdere tabellen aanpast documenteren wij dit.
        </td>
    </tr>
</table>

## Documentatie producten/kwaliteitseisen TO
<table>
    <tr>
        <th>
            Kwaliteitscriteria
        </th>
        <th>
            Keuring
        </th>
        <th>
            Argument
        </th>
    </tr>
    <tr>
        <td>
            Voldoet aan AIM controle kaart (zie Plan van aanpak hoofdstuk 6).
        </td>
        <td>
            V
        </td>
        <td>
            Het TO voldoet voldoende aan de AIM controle kaart.
            Het kan hier en daar nog wel wat beter qua zinsstructuren, maar over het algemeen is het TO voldoende en voldoet die aan de AIM controle kaart.
        </td>
    </tr>
    <tr>
        <td>
            Is minimaal door één andere groepsgenoten doorgelezen en goedgekeurd.
        </td>
        <td>
            G
        </td>
        <td>
            Elke onder in het TO is door één ander persoon gereviewd. 
        </td>
    </tr>
    <tr>
        <td>
            Naamgevingen binnen documenten zijn consistent met elkaar.
        </td>
        <td>
            V
        </td>
        <td>
            Naamgeving binnen het TO is redelijk consistent, maar kan soms wat beter.
        </td>
    </tr>
    <tr>
        <td>
            Het To bevat geen spellingfouten
        </td>
        <td>
            V
        </td>
        <td>
            Het TO heeft hier en daar nog een paar spellingsfouten, maar is grotendeels goed.
        </td>
    </tr>
</table>

## PVA H6 Op te leveren producten en kwaliteitseisen
<table>
    <tr>
        <th>
            Kwaliteitscriteria
        </th>
        <th>
            Keuring
        </th>
        <th>
            Argument
        </th>
    </tr>
    <tr>
        <td>
            Het TO moet volledig zijn.
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind dat het TO volledig is, omdat het alle dingen bevat die in en TO horen zoals:
            Non-functionele requirements te specificeren, met uitwerkingen, waardoor duidelijk wordt waaraan het systeem moet voldoen en hoe het aan deze eisen voldoet.
            Een architectuuroverzicht te bieden waarin alle componenten van ons systeem worden weergegeven, zodat de structuur van het systeem duidelijk wordt wat zorgt voor traceability en beter kwaliteit.
            Een PDM (Physical Data Model) op te nemen met daaronder tabellen die de betekenis van elk attribuut beschrijven, wat inzicht geeft in de opbouw van onze relationele database.
            Integrity Rules te definiëren die duidelijkheid verschaffen over de implementatie van de business rules.
            Uitgebreide uitleg te geven over complexe code en onderdelen, zodat iemand die niet eerder met het systeem heeft gewerkt, het kan begrijpen en uitbreiden.
            Indexes te documenteren, inclusief uitleg over de locatie en redenen voor hun gebruik, wat duidelijkheid biedt over de gemaakte keuzes tijdens de ontwikkeling en zorgt voor traceerbaarheid en hogere kwaliteit.
            Een onderdeel te hebben die aangeeft welke onderdelen zijn voltooid en welke niet, wat bijdraagt aan betere traceerbaarheid en kwaliteit.
            <br>            
            Dit vind ik een slechte kwaliteitscriteria aangezien het niet SMART is.
        </td>
    </tr>
    <tr>
        <td>
            De maatregelen die genomen zijn om de datakwaliteit te verbeteren, zijn gedocumenteerd met de bijbehorende code en de resultaten.
        </td>
        <td>
            O
        </td>
        <td>
            Wij hebben niet echt maatregelen in ons TO die wij hebben genomen om onze datakwaliteit te verbeteren.
            Wij hebben dit in ons FO staan onder besluiten voor verwoordingen.
        </td>
    </tr>
    <tr>
        <td>
            Bevat een foto van het PDM.
        </td>
        <td>
            G
        </td>
        <td>
            Deze is goed, omdat het TO een foto bevat van het PDM.
        </td>
    </tr>
    <tr>
        <td>
            Het PDM komt overeen met het CDM
        </td>
        <td>
            G
        </td>
        <td>
            Deze vind ik goed, omdat ons PDM direct is gegenereerd uit het PDM en daardoor precies overeenkomt.
        </td>
    </tr>
    <tr>
        <td>
           Besluiten tijdens het generen van het PDM zijn beschreven en onderbouwt.
        </td>
        <td>
            O
        </td>
        <td>
            Deze is onvoldoende aangezien wij niet de besluiten tijdens het PDM generen hebben opgeschreven
        </td>
    </tr>
    <tr>
        <td>
            Alle tabellen en kolommen van de database zijn duidelijk beschreven.
        </td>
        <td>
            G
        </td>
        <td>
            Deze is goed, omdat alle tabellen en attribute van ons PDM zijn omschreven in tabellen.
        </td>
    </tr>
    <tr>
        <td>
            Alle business rules zijn beschreven. 
        <td>
            G
        </td>
        <td>
            Deze is goed, omdat alle bussines rule die werden vereist van onze opdrachtgever staan omschreven in het FO.
            De business horen trouwens in het FO en niet in het TO dus dit is een fout van ons PVA.
        </td>
    </tr>
    <tr>
        <td>
            Alle Integrity rules en besluiten daarvan zijn beschreven en onderbouwt. 
        <td>
            V
        </td>
        <td>
            Deze is voldoen, omdat wij alle integrity rules die onze opdrachtgever wou hebben opgeschreven en onderbouwt op twee na. 
        </td>
    </tr>
</table>