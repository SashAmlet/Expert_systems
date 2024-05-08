% Тварини
animal(dog).
animal(cat).
animal(duck).

% Властивості тварин
has_fur(dog).
has_fur(cat).
has_feathers(duck).
says_woof(dog).
says_meow(cat).
says_quack(duck).

% Правило для отримання списку тварин на основі фактів
get_matching_animals([], []).
get_matching_animals([Fact|Rest], MatchingAnimals) :-
    findall(Animal, (animal(Animal), call(Fact, Animal)), FactAnimals),
    (Rest = [] ->
        MatchingAnimals = FactAnimals
    ;   get_matching_animals(Rest, RestAnimals),
        intersection(FactAnimals, RestAnimals, MatchingAnimals)
    ).

main :-
    write("Welcome to the animal identification system!"), nl,
    write("Please enter the facts about animals:"), nl,
    read(Facts),
    get_matching_animals(Facts, MatchingAnimals),
    (MatchingAnimals = [] -> write("No matching animals found. Sorry!"), nl
    ; format("Matching animals: ~w~n", [MatchingAnimals])).

