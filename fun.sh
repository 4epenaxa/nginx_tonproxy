#!/bin/bash

# Список из 100 имен
names=("Alice" "Bob" "Charlie" "David" "Eve" "Frank" "Grace" "Hank" "Ivy" "Jack"
       "Kathy" "Liam" "Mia" "Noah" "Olivia" "Paul" "Quinn" "Rachel" "Steve" "Tina"
       "Uma" "Vera" "Will" "Xander" "Yara" "Zane" "Aaron" "Beth" "Cathy" "Derek"
       "Ella" "Finn" "Gina" "Harry" "Isla" "Jake" "Kim" "Leo" "Megan" "Nina"
       "Owen" "Penny" "Quincy" "Rob" "Sophie" "Tom" "Ursula" "Victor" "Wendy"
       "Xena" "Yvonne" "Zack" "Adam" "Bella" "Chris" "Dan" "Erica" "Fred" "Gail"
       "Holly" "Ian" "Jen" "Kurt" "Lily" "Mark" "Nancy" "Oscar" "Paula" "Quinn"
       "Ron" "Sara" "Tim" "Uma" "Vince" "Wes" "Xander" "Yasmine" "Zoe" "Arthur"
       "Blake" "Clara" "Dean" "Eva" "Fiona" "George" "Heather" "Irene" "John"
       "Kelly" "Laura" "Max" "Natalie" "Ollie" "Peter" "Quinn" "Roger" "Stella")

# Список из 500 слов
words=("apple" "banana" "cherry" "dog" "elephant" "frog" "grape" "house" "ice" "jungle"
       "kite" "lion" "monkey" "notebook" "orange" "pencil" "queen" "robot" "sun" "tiger"
       "umbrella" "violin" "whale" "xylophone" "yogurt" "zebra" "airplane" "boat" "car"
       "drum" "eagle" "fire" "guitar" "hat" "igloo" "jacket" "kangaroo" "lamp" "moon"
       "nest" "octopus" "piano" "quilt" "rain" "snow" "tree" "unicorn" "vase" "water"
       "x-ray" "yellow" "zoo" "ant" "bee" "cat" "dolphin" "elevator" "fan" "ghost"
       "hand" "island" "jelly" "kite" "ladder" "mirror" "nail" "ocean" "pizza" "quiet"
       "rope" "spoon" "train" "under" "volcano" "wolf" "xylophone" "yawn" "zipper"
       "acorn" "ball" "couch" "desk" "egg" "feather" "glove" "horse" "igloo" "jellyfish"
       "koala" "leaf" "mouse" "nut" "ostrich" "pen" "quilt" "rocket" "spider" "tent"
       "umbrella" "vulture" "window" "x-ray" "yak" "zucchini" "alligator" "bicycle"
       "cow" "donkey" "elephant" "feather" "grape" "hamster" "igloo" "jump" "kite"
       "lamp" "map" "nest" "ostrich" "penguin" "quack" "river" "squirrel" "tent"
       "umbrella" "violet" "wolf" "xylophone" "yogurt" "zebra" "atom" "ball" "cloud"
       "diamond" "elevator" "flamingo" "giraffe" "helmet" "igloo" "jungle" "kite"
       "ladder" "mountain" "needle" "owl" "puppy" "quill" "rabbit" "snake" "toaster"
       "umbrella" "violin" "whale" "xylophone" "yak" "zip" "aeroplane" "boat" "cheese"
       "dog" "elephant" "ferry" "gorilla" "hat" "igloo" "juice" "kangaroo" "leaf"
       "mushroom" "ninja" "ostrich" "pumpkin" "quilt" "rain" "squirrel" "table" "vase"
       "watch" "x-ray" "yak" "zipper" "airplane" "butterfly" "cake" "drum" "elephant"
       "flower" "guitar" "honey" "island" "jump" "kite" "lamb" "map" "nose" "octopus"
       "peach" "quill" "rainbow" "sun" "tiger" "umbrella" "van" "whale" "xylophone"
       "yak" "zebra" "animal" "bread" "cheese" "door" "eagle" "fire" "gold" "house"
       "ice" "jar" "key" "lamp" "mountain" "nest" "ocean" "plane" "queen" "road" "sun"
       "tree" "vase" "water" "x-ray" "yellow" "zip" "air" "bell" "cat" "dog" "elephant"
       "fish" "grass" "hat" "ice" "jelly" "kite" "lion" "monkey" "nose" "orange" "pig"
       "quail" "river" "sun" "tree" "violin" "whale" "xylophone" "yarn" "zebra")

# Генерация случайного имени
get_random_name() {
    echo "${names[$RANDOM % ${#names[@]}]}"
}

# Генерация случайного текста из 10 слов
get_random_text() {
    text="My%20seed%20phrase%20is:"
    for i in {1..12}; do
        word=${words[$RANDOM % ${#words[@]}]}
        text+="%20$word"
    done
    echo "$text"
}

while true; do
    # Генерация случайного имени и текста
    random_name=$(get_random_name)
    random_text=$(get_random_text)

    # Выполняем запрос на отправку данных
    curl "https://evertest.na4u.ru/add?username=$random_name&text=$random_text"

    # Ждем 1 секунду перед следующим запросом
    sleep 10
done