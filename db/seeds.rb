Teacher.create!(    name: 'name', 
                   lastname: 'lastname', 
                   login: "wyk001", 
                   password_digest: BCrypt::Password.create("wyk001"), 
                   email: 'wy1@example.com')
Teacher.create!(    name: 'Wy1Im', 
                   lastname: 'Wy1Naz', 
                   login: "wyk002", 
                   password_digest: BCrypt::Password.create("wyk002"), 
                   email: 'wy1@example.com')



Medal.create!(name: "Medal za wytrwałość",
              description: "Medal za 100% obecności",
              img: "/assets/medal/medal_stopro.png",
              value:5)
              
Medal.create!(name: "Szybkie kopytko",
              description: "Medal za najszybszą odpowiedź",
              img: "/assets/medal/medal_speed.png",
              value:6)
Medal.create!(name: "Odważny jak niedźwiedź",
              description: "Medal za udział w wyzwaniu",
              img: "/assets/medal/medal_bear.png",
              value:5)
Medal.create!(name: "Precyzja Odyna",
              description: "Medal za rozwiązanie zadania na 100%",
              img: "/assets/medal/medal_precyzja.png",
              value:5)
              
Story.create!(level:1,
              number:1,
              content:"Za górami, za lasami żył sobie Bjorn. Pewnego zimnego ranka obudziło go stukanie w okno. Po paru chwilach, gdy w końcu udało mu się otworzyć oczy, zobaczył Drozda z liścikiem w dziobie. Wystraszył się, że to kolejne pismo od komornika. Po otwarciu koperty zobaczył to … 
              „Przyjeżdżam za 6 tygodni, mam nadzieje, że przygotujesz dla mnie cos dobrego… - TEŚCIOWA.”",
              title:"List")
Story.create!(level:1,
              number:2,
              content:"Bjorn ze strachu przed swoja teściową zaczął pakować wszystkie potrzebne i niepotrzebne rzeczy. Zastanawiał się długo, gdzie mógłby się przed nią schować. W końcu przyleciał drozd radząc, by wiał gdzie pieprz rośnie.",
              title:"Panika")
Story.create!(level:1,
              number:3,
              content:"Bjorn postanowił zostawić małą niespodziankę swojej teściowej. Wiedział, że ta nie wytrzymałaby bez zaglądania do spiżarni, gdzie trzymał jej ukochany bigos, dlatego do każdego słoika dodał po kilka papryczek chili. W taki sposób teściowa posiadła umiejętność ziania ogniem.",
              title:"Niespodzianka")
Story.create!(level:1,
              number:4,
              content:"Po długim marszu Bjorn i Drozd, postanowili uciąć sobie drzemkę pod drzewem. Przyśnił mu się dzień, w którym niespodziewanie odwiedziła go teściowa. Z hukiem wpadła do chatki, domagając się obiadku. Wyczyściła mu z bigosu całą spiżarnię, a Bjorn tylko biegał z garem, żeby dać jej dokładkę. Niestety, niechcący albo chcący wpadł mu do kotła czosnek. Staruszka zaczęła się dusić, bo okazało się, że jest na niego uczulona. Po przebudzeniu olśniło Bjorna i udał się na pobliskie pole z czosnkiem, aby w razie czego mieć coś do obrony.",
              title:"Koszmar")
Story.create!(level:1,
              number:5,
              content:"W celu zebrania załogi na swój statek, Bjorn chodził od chatki do chatki prosić innych ludzi, aby zgodzili się na wspólną ucieczkę. Mało kto chciał otworzyć mu drzwi, bo bali się, że Teściowa, która jest postrachem nie tylko Bjorna, ale też całej wioski – wcześniej przyjechała. Jednak przyjemny odgłos ćwierkania Drozda pozwolił im uwierzyć, że to nie to, o czym myślą. Po wysłuchaniu próśb biednego wikinga, zgodzili się towarzyszyć mu w wyprawie. Wszyscy razem udali się do portu, gdzie zaczęli wspólną przygodę",
              title:"Ucieczka")
Story.create!(level:2,
              number:1,
              content:"Po wielu tygodniach bujania się po morzu w wielkim skwarze bez najmniejszego podmuchu wiatru, który muskałby ich brody, zorientowali się, że kończą im się zapasy wody, a co najgorsze, od tygodnia nie mieli w ustach czegoś mocniejszego. Wikingowie, jako naród żyjący wśród śniegu nie są przyzwyczajeni do słońca, dlatego też strasznie cierpieli w upale i zaczęli coś majaczyć.",
              title:"Cicha woda")
Story.create!(level:2,
              number:2,
              content:"Następnego ranka na horyzoncie ujrzeli skałę, a na niej postać kobiety. Wszyscy co do jednego chwycili za wiosła i zaczęli gnać w jej stronę. Gdy podpłynęli trochę bliżej zobaczyli, że to piękna syrena, kusząca ich swoim głosem. Wikingowie nie mogąc oprzeć się tej niewiaście, siedzieli oparci o burtę z jęzorami na wierzchu i śliną cieknącą po brodzie. Drozd przyglądał się im z góry dłuższa chwilę, po czym rzekł: „Księga Wikingów mówi jasno: Kto się w syrenie zakocha, temu morze strzeli focha!”, lecz nikt go nie słuchał, więc odwrócił się do nich ogonem i odleciał.",
              title:"Syrenka")
Story.create!(level:2,
              number:3,
              content:"Wszyscy jeszcze oszołomieni widokiem syreny nie zauważyli, że zaczęło coraz bardziej bujać statkiem. Jedni kładli się sądząc, że przechyły będą mniej odczuwalne, inni trzymali się masztu, bo uznali go za dobre miejsce, a reszta załogi dzielnie sterowała statkiem, aby płynąć ciągle przed siebie i jak najszybciej uciec od wrednej kobiety – TEŚCIOWEJ.",
              title:"Przechyły")
 Story.create!(level:2,
              number:4,
              content:"Po kilku dniach ciągłej walki z wiatrem, jedni zrobili się zieloni na twarzy i zaczęli farbować wodę, drudzy nadal trzymali się masztu coraz bardziej trzęsąc portkami, a cała reszta z Bjornem na czele dzielnie prowadziła łajbą. Aż tu nagle, ni z gruchy ni z pietruchy obok nich wynurzył się dziwny stwór. Długi był na 100 metrów, do węża bardzo podobny, ale na łbie miał potężnego irokeza. Bjorn spytał go: „Kim jesteś i gdzie znajdę jakiś ląd?”, po czym ten odpowiedział: „Loko mówią mi, a ląd wiele mil ssssstąd jesssst”, po czym zanurzył się ochlapując wszystkich i odpłynął w nieznane.",
              title:"Wąż Loko")
Story.create!(level:2,
              number:5,
              content:"Po rozmowie z wężem Lokiem na niebie zebrały się czarne chmury. Wtedy już cała załoga zaczęła panikować i miała pełne gacie. Jedynie Bjornowi pozostały resztki rozumu i krzyknął do załogi: „Czego się bardziej boicie – podmuchu wiaterku, czy oddechu teściowej?!” Wtedy wszyscy bez chwili namysłu ruszyli dalej. Wpłynęli w wielką burzę, miotało nimi jak szatan na lewo i prawo, aż w końcu fala zepchnęła ich na skałę i cała łódź poszła w drzazgi. Bjorn w ostatniej chwili złapał ocalałą deskę i próbował dostrzec resztę swojej załogi. Niestety, nikogo nie zobaczył. Jedynie w oddali słyszał słowa Drozda „BJORN come back, come back…”",
              title:"Sztorm")
Story.create!(level:3,
              number:1,
              content:"Bjorn wyrzucony przez morskie fale, leżał nieprzytomny na plaży. Obudziło go stukanie Drozda w jego hełm. Otworzył oczy i ujrzał przyjaciela, który powiedział do niego „Stary, Tobie to dać stery …” Bjorn nie pamiętał nic z tego, co się wydarzyło poprzedniego dnia. Drozd opowiedział mu o całym zdarzeniu, bo w momencie  gdy opuścił załogę, aby szukać najbliższego lądu, wracał na statek, żeby powiedzieć wikingom o swoim odkryciu i wtedy zobaczył, jak rozbijają się o skałę.",
              title:"Rozbitek")
Story.create!(level:3,
              number:2,
              content:"Wygląd wyspy, na której się znaleźli zdziwił ich, ponieważ była ona całkiem inna niż te w miejscu ich zamieszkania. Bjorn poczuł, że coś go kłuje w plecy. Wyglądało to jak duża, brązowa włochata kulka. Nie wiedział co to jest, ale pomyślał, że jak będzie z tym chodzić i do tego czegoś mówić, to w końcu coś się wykluje. Na chwilę zapominając o tym, co znalazł, zaczął wzywać pomoc. Po kilku godzinach nadal nikt go nie usłyszał, dlatego ze złości wziął swoje „jajo” i rzucił nim o palmę. Magiczna kulka rozpadła się, ale uderzenie było tak silne, że z palmy spadło kilka nowych. Bjorn podniósł rozbitą kulkę. Pięknie pachniała, więc spróbował ją zjeść. Postanowił, że nazwie to kokos i zrozumiał, że dzięki nim będzie miał pożywienia na wiele dni.",
              title:"Kokos?")
Story.create!(level:3,
              number:3,
              content:"Bjorn stwierdził, że nie ma zamiaru już spać na kokosach, więc udał się do dżungli, aby znaleźć gałęzie i liany na hamak. Nagle przypomniał sobie, że zgubił swój topór, więc zębami twardymi niczym skała łamiąca statek utnie potrzebne mu materiały. Długo się męczył, poprosił też drozda o pomoc w dziobaniu drewna i w końcu udało się. Bjorn rozwiesił sobie hamak między dwiema palmami i zasypiając myślał o tym, co go czeka jutro.",
              title:"Hamak")
Story.create!(level:3,
              number:4,
              content:"Dobrobyt uderzył Bjornowi do głowy i jak już ma ekskluzywny hamak, to przecież nie będzie się żywić samymi kokosami. Postanowił więc ponownie udać się do dżungli, aby znaleźć coś, z czego mógłby wykonać wędkę. Pełen doświadczenia z poprzedniego dnia uwinął się z tym raz dwa . Wrócił na swoją plażę, ale złowić rybę nie było wcale tak łatwo. Na początku mu nie szło, ciągle łowił stare deski, buty i staniki. Aż w końcu po podniesieniu wędki przeżył szok. Jego oczom ukazała się złota rybka. Powiedziała, że może spełnić jego 3 życzenia. Bjorn nie mógł uwierzyć, więc odparł: „No to zrób tak, żeby Drozd miał różowy ogon”. Przez chwilę nic się nie działo, aż tu bach! Różowe pióra! Bjorn pomyślał, że ja może mieć wszystko co chce, to mógłby odzyskać swój toporek. Rybka go wysłuchała, broń spadła z nieba i uderzyła go w łeb, tym samym powalając go na ziemię. Drozd pochylił się nad nim i szyderczym głosem powiedział : „HA! To za te pióra!”
              ",
              title:"Złota rybka")
Story.create!(level:3,
              number:5,
              content:"W czasie, gdy Bjorn leżał jak zabity, rybka wykorzystała okazję i uciekła. Drozd strasznie wkurzył się na swojego towarzysza i tym razem postanowił go nie budzić i pozostawił go leżącego na plaży w pełnym słońcu, żeby smażył się jak kotlet na patelni.",
              title:"Twardy sen")
Story.create!(level:4,
              number:1,
              content:"Po całym dniu leżenia nieprzytomnie na słońcu, Bjorn był czerwony jak rak. Po podniesieniu się, wiking zobaczył swój ukochany toporek i z wielką radością zaczął skakać i dziko tańczyć. Poczuł jednak, że wszystko go piecze, więc wskoczył do morza, przy czym rozniósł się charakterystyczny dźwięk „tsssss…”. Wtem nagle wynurzył się wąż Loko i ze zdziwieniem odparł: „eee to tylko wy, myśśśślałem, że to moja sssstara…”, po czym odpłynął. Bjornowi zrobiło się lżej po kąpieli i wrócił na ląd.",
              title:"Skwarek")
Story.create!(level:4,
              number:2,
              content:"Bjorn z Drozdem wylegiwali się na hamaku w cieniu palm, gdy nagle pojawiły się dziwne chmury. Po chwili zastanowienia doszli do wniosku, że to musi być dym. Pochodził on drugiej strony wyspy. Przyjaciele i tak nie mieli nic do roboty, więc wzięli kokosy na drogę i ruszyli w kierunku dziwnego zjawiska. Były dwie opcje: pożar, który może ich zabić, lub wyspa jednak nie jest bezludna.",
              title:"Dymek")
Story.create!(level:4,
              number:3,
              content:"Po kilku godzinach walki z krzakami, dotarli na wielkie pole. Podeszli bliżej i zobaczyli, że na krzakach rosną dziwne czarne kuleczki. Bjorn po miłych doświadczeniach z kokosami postanowił sprawdzić, jak to smakuje. Niestety zaczął kaszleć, prychać i kichać. Przypomniał sobie, że dodawał trochę tego do bigosu, ale nigdy tak naprawdę nie wiedział dlaczego. Oboje stali zamyśleni, a nagle Drozd wybuchnął śmiechem i krzyknął: „HA! Zwialiśmy tam, gdzie pieprz rośnie!”",
              title:"Pieprz")
Story.create!(level:4,
              number:4,
              content:"Gdy fascynacja pieprzem minęła, spostrzegli dym, do którego chcieli dojść. Znajdował się on na końcu wielkiego pola. Przeszli przez pieprzowe krzaki ciągle kichając, aż w końcu dotarli do małej chatki. Zapukali, a z domku wybiegł dziadek, który celował do nich z procy nabitej pieprzem. Starzec miał wielkie oczy i nos oraz czoło wjeżdżające na potylice (zakola :)). Po krótkiej rozmowie z nim dowiedzieli się, że on również uciekał wiele lat temu od swojej teściowej gdzie pieprz rośnie. Po kilku godzinach gadania, Bjorn zapytał dziadka z ciekawości, dlaczego ma takie wielkie oczy. Ten odparł mu na to, że musi dobrze widzieć intruzów na swoim polu. Bjorn z jeszcze większym zainteresowaniem zapytał: „A dlaczego masz taki duży nos?” – ten śmiejąc się odparł – „A to przez ciągłe kichanie od pieprzu.”",
              title:"Dziadek")
Story.create!(level:4,
              number:5,
              content:"Cała trójka rozmawiała ze sobą do późnej nocy o wszystkim i niczym. Dziadek przypomniał sobie, że w ostatnim czasie na wyspie działo się coś dziwnego. Opowiadał im o tym jak wulkan zaczął sobie popierdywać, pogoda zrobiła się kapryśna jak baba, a pieprzowe krzaki zaczęły więdnąć. W tym momencie staruszek zaczął trząść się ze strachu i rozpoczął opowiadać o tym, jak szedł sobie w nocy do wychodka, a tu nagle zobaczył jakąś postać w krzakach, w której okularach odbijał się księżyc i przypomniał sobie o wieczorach, kiedy światło lampki odbijało się od szkieł teściowej w podobny sposób. Dziadek powiedział, że po tych wydarzeniach niebezpiecznie jest chodzić po nocy, więc zaproponował im żeby zostali na kilka kolejnych dni.",
              title:"Zła nowina")
Story.create!(level:5,
              number:1,
              content:"Po kilku dniach mieszkania z dziadkiem, Bjorn wyszedł pozwiedzać trochę okolicę. Usłyszał jakieś dziwne głosy, krzyki i ryki, które brzmiały znajomo. Nie zastanawiał się długo co to mogło być, tylko od razu uciekł do ich kryjówki. Opowiedział towarzyszom o tym co się stało. Drozda nagle olśniło. Poskładał wszystkie fakty w całość i okazało się, że bardzo prawdopodobnie teściowe mają spisek i próbują odnaleźć zięciów.",
              title:"Spisek")
Story.create!(level:5,
              number:2,
              content:"Mężczyznom nawet nie przyszło do głowy, żeby spotkać się z treściową. Mówili jaka to ona zła, jak im życie zmarnowała i najchętniej wymazaliby ją z pamięci. W chatce czuli się bezpiecznie i nie chcieli jej opuszczać. Drozd nie mógł już tego słuchać i starał się namówić ich, aby jednak stawili jej czoła. Zapytał, czy zamierzają żyć w ciągłym strachu, czy iść do niej, załatwić sprawę po męsku. Ostatecznie, po namowach Drozda podjęli decyzję o podróży.",
              title:"Trudna decyzja")
Story.create!(level:5,
              number:3,
              content:"Przyjaciele nie wiedząc co robić, siedzieli zamyśleni przy stole. Po chwili Drozd wskoczył na stół i powiedział: „Gdy teściowa zły humor ma, to wtedy bigos na nic się zda”. Następnie opowiedział , jak można zwabić, ją pięknym zwierzęcym futrem.",
              title:"Misterny plan")
Story.create!(level:5,
              number:4,
              content:"W końcu po wielu namysłach, postanowili wyruszyć w stronę pieczary teściowej. Bjorn zakłopotany myślą o spotkaniu ze staruszką, powiedział do Drozda: „Ani mi się śni rozmawiać z nią gdy jest na wolności!” Pomyśleli, że mogliby ją schwytać, więc zaczęli szukać potrzebnych materiałów.",
              title:"Pułapka")
Story.create!(level:5,
              number:5,
              content:"Na niebie były już gwiazdy, gdy dotarli pod pieczarę teściowej. Rozejrzeli się i na szczęście nie było jej w środku. Ukryli się w krzakach, aby przemyśleć dokładnie plan działania. Dziadziuś zaczął dygotać ze strachu i oznajmił im, że nie może iść z nimi dalej, tłumacząc to tym, że mógłby dostać zawału na widok teściowej. W ramach przeprosin podarował Bjornowi swoją procę z pieprzem. Drozd także postanowił opuścić przyjaciela mówiąc, że tylko on może pokonać teściową. Dał mu swoje różowe pióro na szczęście i życzył powodzenia.",
              title:"Tchórz")
Story.create!(level:6,
              number:1,
              content:"Bjorn niepewnym krokiem udał się w stronę pieczary. Jeszcze raz się upewnił, że nie ma w środku teściowej, po czym zaczął szybko kopać dziurę. Gdy była już gotowa przykrył ją liśćmi, a futro ułożył obok pułapki. Aż tu nagle, usłyszał kroki teściowej. Szybko schował się za pobliskie drzewo, aby obserwować sytuację.
",
              title:"Dziura")
Story.create!(level:6,
              number:2,
              content:"Coraz bardziej było słychać kroki teściowej, aż w końcu Bjorn wychylając się zza drzewa, zobaczył ją. Staruszka, wracając do swojej pieczary, dostrzegła piękne futro leżące na ziemi i zaryczała: „Muuuuuuszę to mieć!” Zaczęła biec w jego stronę, a ziemia trzęsła się tak, że aż biedny wiking zaczął podskakiwać. W końcu wpadła w pułapkę Bjorna i krzyknęła tak głośno, że staruszek siedzący w krzakach osiwiał, a Drozd stracił wszystkie pióra.",
              title:"Futro")
Story.create!(level:6,
              number:3,
              content:"Bjorn nie odważył się od razu porozmawiać z teściową, więc postanowił poczekać do rana. Kiedy pokonał strach, podszedł do dziury i cieniutkim głosikiem powiedział „Hop hop, nic mamusi nie jest?” Wtedy ta zionęła ogniem w jego stronę, przypalając mu brodę, Bjorn strasznie się zezłościł, bo bardzo kochał swoją rudą brodę i strzelił pieprzem w jej oczy.",
              title:"Spalony")
Story.create!(level:6,
              number:4,
              content:"Teściowa na chwilę oślepła po celnym strzale Bjorna. Wykorzystał on okazję, wskoczył do staruszki i zaczął ja gilgotać w stopy piórkiem drozda. Nie wytrzymując ze śmiechu, zaczęła się trząść jak galareta i kazać mu przestać. Bjorn odpowiedział, jej „Przestanę, jak obiecasz mi, że już nigdy nie tkniesz mojego bigosu”. Teściowa nie mając innego wyboru, od razu zgodziła się.",
              title:"Salwa śmiechu")
Story.create!(level:6,
              number:5,
              content:"Zaniepokojeni ciszą Staruszek z ptakiem wybiegli ze swojej kryjówki, aby zobaczyć co się dzieje. Gdy Drozd zobaczył ich razem uśmiechnął się i powiedział: „ A morał z tej bajki jest krótki i niektórym znany: gdy teściowa swój nos wtyka, tylko bigos jej usta zamyka!”  ",
              title:"Happy End")
for j in 1..6
    for i in 1..5
     Exercise.create!(teacher_id: "1",
                    level: j,
                    number: i,
                    reward: "100",
                    content: "zadanie #{i} dzien #{j}",
                    variant: 1
                    )
    end
end