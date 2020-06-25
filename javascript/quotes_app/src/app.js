new Vue({
  el: '#app',
  data: {
    quotes: [],
    currentPage: 1,
    perPage: 5,
    theme: null,
    search: ''
  },
  methods: {
    previousPage() {
      if(this.currentPage > 1) {
        this.currentPage--
      }
    },

    nextPage() {
      if(this.currentPage <= this.totalPages) {
        this.currentPage++
      }
    },
  },
  computed: {
    filterTheme() {
      if(this.theme) {
        return this.quotes.filter(quote => {return quote.theme == this.theme})
      }
      return this.quotes
    },

    searchQuotes() {
      return this.filterTheme.filter(post => {
        return post.quote.toLowerCase().includes(this.search.toLowerCase())
      })
    },

    totalPages() {
      return Math.trunc(this.filterTheme.length / this.perPage)
    },

    viewStart() {
      return (this.currentPage - 1) * this.perPage
    },

    viewEnd() {
      return this.viewStart + this.perPage - 1
    },

    pageList() {
      return [...Array(this.totalPages).keys()].map((n, index) => { return n + 1})
    },
  },
  created() {
    axios.get('https://gist.githubusercontent.com/benchprep/dffc3bffa9704626aa8832a3b4de5b27/raw/quotes.json')
    .then(response => {
      this.quotes = response.data.map((quote, index) => {
        return Object.assign(quote, {id: index})
      })
    })
  },
})
