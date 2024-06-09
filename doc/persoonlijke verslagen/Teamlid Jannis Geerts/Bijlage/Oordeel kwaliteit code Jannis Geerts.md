## Oordeel kwaliteit: code Jannis Geerts
De keuring wordt met O, V of G beoordeeld.
- O: Onvoldoende, het voldoet niet aan alle eisen en of is niet volledig uitgewerkt
- V: Voldoet aan de opgestelde beschrijving maar mist inhoudelijk context
- G: goed, voldoet aan de opgestelde beschrijving en heeft inhoud waarop verder gebouwd kan worden.

## DoD code
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
            Code algemeen
        </td>
        <td>
            <li>Alle code moet Engelstalig zijn.</li>
            <li>Branches gemaakt vanuit Jira ticket zodat de naamgeving consistent is.</li>
            <li>Pull Request aangemaakt.</li>
            <li>Pull Request bevat duidelijke commit messages.</li>
            <li>Pull Request worden gereviewd door minimaal één teamlid.</li>
            <li>Alle tests slagen.</li>
            <li>De code is ingesprongen en bevat witregels.</li>
            <li>Functies en variabelen worden in lowerCamelCase gemaakt.</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind deze goed aangezien elke stuk code die wij hebben gemaakt is de code Engelstalig, zit die in een aparte branch gemaakt vanuit een Jira ticket, is een pull request voor aangemaakt die duidelijke commit message bevatten en was gereviewd door één teamlid, de code heeft ingesprongen witregels en de functies en variable worden in lowerCamelCase geschreven.
        </td>
    </tr>
    <tr>
        <td>
            Create script
        </td>
        <td>
            <li>Is traceerbaar vanaf het PDM.</li>
            <li>Moet in een keer uitgevoerd kunnen worden.</li>
            <li>Bevat een create statement.</li>
            <li>Bevat een drop tabel if exists.</li>
            <li>Bevat keys.</li>
            <li>Bevat stored procedures.</li>
            <li>Bevat triggers.</li>
            <li>Bevat constraints.</li>
            <li>De naam van het script is in lower camelcase geschreven.</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vond ons create scrip goed, omdat het relationele gedeelte van de database create script traceerbaar is naar het PDM en direct gegenereerd met Powerdesigner.
            Daarnaast kun je het door if exists statements en hoe het create script is opgebouwd in één keer runnen.
            Ook bevat het de benodigde triggers, stored procedures en constrians.
            Deze zijn ook allemaal in lower camelcase geschreven.
        </td>
    </tr>
    <tr>
        <td>
            Stored procedures
        </td>
        <td>
            <li>Gebruiken SP_ voor de naam in grote letters.</li>
            <li>De naam van de procedure wordt in lower camelcase geschreven.</li>
            <li>Een stored procedure die een select statement gebruikt hoort een index te gebruiken als dit de query versneld.</li>
            <li>Maakt gebruik van onze template</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind dat de stored procedures goed zijn aangezien ze doen aan de consistentie door altijd te starten met SP_ voor de naam en de naam zelf is altijd in lower camelcase geschreven.
            Daarnaast is er bij elke select stored procedure die er voordeel aan had een index opgezet en hebben wij gebruik gemaakt van onze eigen template en die van de HAN voor transactions.
            Ook hebben wij meerdere keren besproken met de opdrachtgever hoe de procedures eruit moesten zien.
        </td>
    </tr>
    <tr>
        <td>
            JSON
        </td>
        <td>
            <li>De JSONS worden zo klein mogelijk gehouden door alleen de benodigde data op te slaan.</li>
        </td>
        <td>
            G
        </td>
        <td>
            Ik vind dat de JSON-code goed is aangezien die flexibel is doordat je in de parameters van de JSON send procedure de bouw van de JSON kan meegeven.
            De JSON zelf wordt aangemaakt door een job om de half minuut als de bijbehorende procedure in het executie schema zit.
            Doordat die om de halve minuut wordt aangemaakt in plaats van wanneer iemand iets aanpast aan de database belast je de relationele database ook minder wat weer goed is.
            Daarnaast stuurt de JSON-code alleen de bijbehorende races van het jaar om te voorkomen dat je de hele database overstuurd wanneer er een aanpassing wordt gemaakt.
        </td>
    </tr>
        <tr>
        <td>
            API
        </td>
        <td>
            <li>De variable zijn in lower camelcase geschreven.</li>
        </td>
        <td>
            G
        </td>
        <td>
            De API is goed aangezien wij hem in lower camelcase hebben geschreven.
        </td>
    </tr>
    </tr>
        <tr>
        <td>
            Triggers
        </td>
        <td>
            <li>Gebruiken nocount.</li>
            <li>Gebruiken TR_ voor de naam.</li>
            <li>De naam van de trigger wordt in lower camelcase geschreven.</li>
        </td>
        <td>
            G
        </td>
        <td>
            De triggers in onze code zijn goed aangezien wij ze allemaal consistent hebben geschreven met nocount aan het begin, TR_ in de trigger naam en alles in lower camelcase.
        </td>
    </tr>
</table>

## PVA H6 Op te leveren producten en kwaliteitseisen code
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
            De API code moet 65% code coverage hebben.
        </td>
        <td>
            O
        </td>
        <td>
            Wij hebben geen unittest voor de API code waardoor deze onvoldoende is.
            Maar naar mijn mening is dit een slechte/outdated kwaliteitscriteria aangezien wij heel weinig API code hebben waardoor het nauwelijks nuttig is om te testen
        </td>
    </tr>
    <tr>
        <td>
            De testcode moet specifieke functies van de software op een meetbare manier testen.
        </td>
        <td>
            G
        </td>
        <td>
            Dit is een net iets andere verwoorde kwaliteitscriteria die ik all hierboven in code heb onderbouwt. 
        </td>
    </tr>
    <tr>
        <td>
            Voldoet aan de eisen over code uit de Definition of Done.
        </td>
        <td>
            V
        </td>
        <td>
            Ik ben uit de kwaliteit oordeel DoD code die hierboven staat uitgekomen op voldoende.
        </td>
    </tr>
    <tr>
        <td>
            De database structuur moet overeenkomen met het CDM.
        </td>
        <td>
            G
        </td>
        <td>
            Dit is goed, omdat de relationele database structuur compleet overeenkomt met het CDM, omdat het is gegenereerd uit een PDM die is gegenereerd uit het CDM. 
        </td>
    </tr>
    <tr>
        <td>
            De database structuur moet overeenkomen met het PDM.
        </td>
        <td>
            G
        </td>
        <td>
            De relationele database komt overeen met het PDM, omdat het direct hieruit gegenereerd is.
            Daarom vind ik het een goed.
        </td>
    </tr>
</table>
