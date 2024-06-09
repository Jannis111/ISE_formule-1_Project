## Bijlage D
<table>
    <tr>
        <td>Feitnummer</td>
        <td>Zin</td>
    </tr>
  <tr>
        <td>1</td>
        <td>
            PuntID 1 heeft als beschrijving eerste plaats. <br>
            <i style="color: yellow"> PuntID 0 </i> heeft als <i style="color: chartreuse"> beschrijving de snelste lap</i>. <br>
            ET: puntenSysteem &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Att: beschrijving <br>
            ID: Att: puntID <br>
            Predicaat: &lt;puntenSysteem&gt; heeft als &lt;beschrijving&gt;.
        </td>
    </tr>
  <tr>
        <td>2</td>
        <td>
            Puntentelling met PuntID 1 is 25 punten waard. <br>
            Puntentelling met <i style="color: yellow"> PuntID 0 </i> is <i style="color: chartreuse"> 1 punt </i> waard. <br>
            ET: puntenSysteem &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Att: punten <br>
            ID: MATCH <br>
            Predicaat: Puntentelling met &lt;puntenSysteem&gt; is &lt;punten&gt; waard.
        </td>
    </tr>
    <tr>
        <td>3</td>
        <td>
            Coureur met id 2 heeft als achternaam Hamilton. <br>
            <i style="color: yellow">Coureur met id 1</i> heeft als <i style="color: chartreuse">achternaam Verstappen</i>.<br>
            ET: coureur &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Att: achternaam <br>
            ID: Att: coureurId <br>
            Predicaat: &lt;coureur&gt; heeft als &lt;achternaam&gt;.
        </td>
    </tr>
    <tr>
        <td>4</td>
        <td>
            Coureur met id 2 heeft als voornaam Lewis. <br>
            <i style="color: yellow"> Coureur met id 1</i> heeft als <i style="color: chartreuse">voornaam Max</i>.<br>
            ET: coureur &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Att: voornaam <br>
            ID: MATCH  <br>
            Predicaat: &lt;coureur&gt; heeft als &lt;voornaam&gt;.
        </td>
    </tr>
    <tr>
        <td>5</td>
        <td>
            De circuit Yas marinas ligt in de plaats Yas Island. <br>
            De <i style="color: yellow">circuit Zandfort </i> ligt in de <i style="color: chartreuse"> plaats Zandfort </i>. <br>
            ET: circuit &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Att: plaats <br>
            ID: att: circuitNaam <br>
            Predicaat: De &lt;circuit&gt; ligt in de &lt;plaats&gt;. <br>
        </td>
    </tr>
    <tr>
        <td>6</td>
        <td>
            De circuit Yas marinas ligt in het land Abu Dhabi. <br>
            De <i style="color: yellow">circuit Zandfort </i> ligt in het <i style="color: chartreuse"> land Nederland </i>. <br>
            ET: circuit &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ET: land <br>
            ID: MATCH &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ID: att: landNaam<br>
            RT: circuitInLand tussen circuit en land. <br>
            Predicaat: De &lt;circuit&gt; ligt in de &lt;land&gt;. <br>
        </td>
    </tr>
    <tr>
        <td>7</td>
        <td>
            De grand prix op circuit Zandvoort van 2021-01-01 is geëindigd op 15 jan 2021. <br>
            De grand prix op<i style="color: yellow"> circuit Zandvoort van 2022-01-01</i> is geëindigd op <i style="color: chartreuse"> 12 dec 2022. </i> <br>
            ET: race &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Att: einddatum <br>
            ID: ET: circuit + Att: startdatum <br>
            RT: raceOpCircuit tussen race(dependent) en circuit. <br>
            Predicaat: De grand prix op &lt;race&gt; is geëindigd op &lt;eindatum&gt;. <br>
        </td>
    </tr>
    <tr>
        <td>8</td>
        <td>
            De coureur met id 2 zat in de grand prix Abu dhabi van 2021-01-01 met de auto Mercedes gereden. <br>
            De <i style="color: yellow"> coureur met id 1 heeft in grand prix Abu dhabi van 2021-01-01</i> met de auto <i style="color: chartreuse"> auto red bull racing honda</i> gereden.  <br>
            ET: deelnemendeCoureur &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ET: team <br>
            ID: ET: race + ET: coureur  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ID: att: teamNaam<br> 
            ID: MATCH + MATCH <br>
            RT: deelnemendeCoureurInRace tussen deelnemendeCoureur (dependent) en race. <br>
            RT: deelnemendeCoureurBevatCoureur tussen deelnemendeCoureur (dependent) en coureur. <br>
            RT: deelnemendeCoureurInTeam tussen deel deelnemendeCoureur en team <br>
            Predicaat: De &lt;deelnemendeCoureur&gt; met de &lt;team&gt; gereden. <br>
        </td>
    </tr>
    <tr>
        <td>9</td>
        <td>
            Het team red bull komt uit Oostenrijk. <br>
            Het <i style="color: yellow"> team force India </i> komt uit <i style="color: chartreuse"> India </i>.  <br>
            ET: team &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ET: land <br>
            ID: MATCH &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ID: Match<br>
            RT: teamThuisLand tussen team en land. <br>
            Predicaat: Het &lt;team&gt; komt uit &lt;land&gt;. <br>
        </td>
    </tr>
    <tr>
        <td>10</td>
        <td>
            De coureur met id 2 in de grand prix Abu dhabi van 2021-01-01 heeft op de 57e lap een lap tijd van 98109 ms. <br>
            De <i style="color: yellow"> coureur met id 2 in de grand prix Abu dhabi van 2021-01-01 heeft op de 58e lap</i> een <i style="color: chartreuse"> lap tijd van 98109 ms</i>. <br>
            ET: lap &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; att: lapTijd <br>
            ID: ET: deelnemendeCoureur + att: huidigeLap <br>
            ID: ET: MATCH <br>
            RT: deelnemendeCoureurZitOpLap tussen lap(dependent) en deelnemendeCoureur. <br>
            Predicaat: De &lt;lap&gt; een &lt;lapTijd&gt;. <br>
        </td>
    </tr>
    <tr>
        <td>11</td>
        <td>
            De coureur met id 2 heeft in de grand prix Abu dhabi van 2021-01-01 een tijd van +2.256s. <br>
            De coureur met id 3 heeft in de grand prix Abu dahabi van 2021-01-01 een tijd + 1 lap. <br>
            De coureur met id 4 heeft in de grand prix Abu dahabi van 2021-01-01 een tijd van DNF. <br>
            De coureur met id 5 heeft in de grand prix Abu dahabi van 2021-01-01 een tijd van DNS. <br>
            De <i style="color: yellow"> coureur met id 1 heeft in de grand prix Abu dahabi van 2021-01-01</i> een tijd van <i style="color: chartreuse"> 1:30.17.345 </i>. <br>
            ET: deelnemendeCoureur &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Att: finishtijd <br>
            ID: ET: race + ET: coureur<br>
            ID: MATCH + MATCH <br>
            RT: deelnemendeCoureurInRace tussen deelnemendeCoureur (dependent) en race. <br>
            RT: deelnemendeCoureurBevatCoureur tussen deelnemendeCoureur (dependent) en coureur. <br>
            Predicaat: De &lt;deelnemendeCoureur&gt; een tijd van &lt;finishtijd&gt;. <br>
        </td>
    </tr>
<tr>
        <td>12</td>
        <td>
            De coureur met id 2 heeft in de grand prix Abu dahabi van 2021-01-01 30 punten gehaald. <br>
            De <i style="color: yellow"> coureur met id 1 heeft in de grand prix Abu dahabi van 2021-01-01</i> <i style="color: chartreuse"> 15 punten gehaald</i>. <br>
            ET: deelnemendeCoureur &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Att: punten <br>
            ID: MATCH<br>
            Predicaat: De &lt;deelnemendeCoureur&gt; een &lt;punten&gt;. <br>
        </td>
    </tr>
    <tr>
        <td>13</td>
        <td>
            De coureur met id 1 heeft in de grand prix op circuit Zandvoort van 2021-01-01 een pitstop op de tijd 22.124. <br>
            De <i style="color: yellow"> coureur met id 1 heeft in de grand prix op circuit Zandvoort van 2021-01-01 </i> een <i style="color: chartreuse"> pitstop op de tijd 32.124</i>. <br>
            ET: deelnemendeCoureur &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ET: pitstop<br>
            ID: MATCH &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ID: att: pitstopTijd <br>
            RT: pitstopVanDeelnemendeCoureur tussen pitstop en deelnemendeCoureur. <br>
            Predicaat: De &lt;deelnemendeCoureur&gt; een &lt;pitstop&gt;.<br>
        </td>
    </tr>
</table>