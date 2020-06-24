new Vue({
  el: '#app',
  data: {
    quotes: null,
    currentPage: 1,
    perPage: 15,
  },
  mounted() {
    axios.get('https://gist.githubusercontent.com/benchprep/dffc3bffa9704626aa8832a3b4de5b27/raw/quotes.json')
    .then(response => {this.quotes = response.data})
  },
})
