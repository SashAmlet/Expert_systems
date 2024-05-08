% Database of animals
animal(camel, fur, short, yes, camel).
animal(cheetah, fur, short, no, cheetah).
animal(caribou, fur, long, _, caribou).
animal(cardinal, feathers, _, red, cardinal).
animal(crossbill, feathers, _, orange, crossbill).
animal(caiman, scales, _, yes, caiman).
animal(chameleon, scales, _, no, chameleon).
animal(carp, scales, no, _, carp).

% Question about protective cover
ask_protective_cover(Animal) :-
    write('What protective cover does the animal have? (fur, feathers, scales): '),
    read(Answer),
    process_protective_cover(Answer, Animal).

% Processing the answer about protective cover
process_protective_cover(fur, Animal) :-
    ask_hair_length(Animal).
process_protective_cover(feathers, Animal) :-
    ask_feather_color(Animal).
process_protective_cover(scales, Animal) :-
    ask_lung_type(Animal).

% Question about fur length
ask_hair_length(Animal) :-
    write('What is the length of the fur? (short, long): '),
    read(Answer),
    process_hair_length(Answer, Animal).

% Processing the answer about fur length
process_hair_length(short, Animal) :-
    write('Can the animal live long without water? (yes, no): '),
    read(Answer),
    (Answer = yes -> Animal = camel ; Answer = no -> Animal = cheetah).
process_hair_length(long, caribou).

% Question about feather color
ask_feather_color(Animal) :-
    write('What color are the feathers? (red, orange): '),
    read(Answer),
    process_feather_color(Answer, Animal).

% Processing the answer about feather color
process_feather_color(red, cardinal).
process_feather_color(orange, crossbill).

% Question about lung type
ask_lung_type(Animal) :-
    write('Does the animal have lungs? (yes, no): '),
    read(Answer),
    process_lung_type(Answer, Animal).

% Processing the answer about lung type
process_lung_type(yes, Animal) :-
    write('Can the animal bite off a leg? (yes, no): '),
    read(Answer),
    (Answer = yes -> Animal = caiman ; Animal = chameleon).
process_lung_type(no, Animal) :-
    write('Does the animal have gills? (yes, no): '),
    read(Answer),
    (Answer = yes -> Animal = carp ; fail).

% Start of the program
start :-
    ask_protective_cover(Animal),
    format('The animal you had in mind is a ~w.~n', [Animal]).
