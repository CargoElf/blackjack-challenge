## JavaScript

### Simple Vue.js List

For this exercise, you will need to build a simple Vue.js app to list the
given quotes. Please do not use any libraries or plugins to do this other
than the core [Vue.js](https://vuejs.org/) and, optionally, a library to fetch
the quotes.

You can assume that you only need to support modern web browsers, so feel
free to build the app using either the new ECMAScript 6 or the older ECMAScript 5
("plain" JavaScript) standard.

Please provide the following functionality:

 * Required: Fetch quotes from the source [quotes.json](https://gist.githubusercontent.com/benchprep/dffc3bffa9704626aa8832a3b4de5b27/raw/quotes.json) and display the available information in a list-like structure (table/list)
 * Required: Provide client-side pagination (up to 15 quotes per page)
 * Required: Provide a way to filter between game and movie quotes
 * Required: Provide a client-side search that filters by the quote text

## Ruby

### Array extension

Please write a module that gives `where` behavior to an array of hashes. (See
`test.rb` and make it pass, or feel free to convert the tests to your favorite
test framework.)

### Simplified Blackjack

`blackjack.rb` contains initial work on a Blackjack game.

Your implementation should complete the initial work on the game and satisfy the following use cases and Blackjack rules:

 * As a Player I can get a hand with two cards in it
 * As a Dealer I can get a hand with two cards in it
 * As a Player I can see what card the dealer is showing
 * As a Player I can blackjack (win immediately) when I am dealt cards (this is a simplification)
 * As a Player I can bust (lose immediately) when I am getting cards
 * As a Dealer I can draw cards after the player until I win or lose
 * At the end of the round (after the Dealer's turn), the result of the round is determined

**Rules:**

 * Bust - Occurs when all possible hand values are greater than 21 points
 * Blackjack - Occurs when a player or dealer is dealt an ace and a 10-point card
 * Dealer - Stays on 17 or above
 * Round Flow - Player acts first, then the dealer acts if necessary

Please use your discretion in fixing/adding tests. You are free to use/convert to any testing framework you want.

For more information on blackjack, please refer to its [wiki page](http://en.wikipedia.org/wiki/Blackjack).
