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
    viableQuotes() {
      let results = []
      results = this.filterTheme
      return results
    },

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

// new Vue({
//   el: '#app',
//   components: {
//     'quote-list': QuoteList
//   },
//   data: {
//     quotes: [],
//     displayedQuotes: [],
//     currentPage: 2,
//     perPage: 15,
//   },
//   calculate: {
//     viewStart: () => {
//       return (this.currentPage - 1) * (this.perPage - 1)
//     },
//     viewEnd: () => {
//       return (this.currentPage - 1) + this.perPage - 1
//     }
//   },
  // methods: {
  //   paginate: () => {
  //     console.log(this.currentPage)
  //     const viewStart = (this.currentPage - 1) * (this.perPage -1)
  //     const viewEnd = viewStart + (this.perPage -1)
  //
  //     this.displayedQuotes = this.quotes.slice(viewStart, viewEnd).forEach(quote => {return quote.visable = true})
  //   },
  //
  // },
  // mounted() {
  //   axios.get('https://gist.githubusercontent.com/benchprep/dffc3bffa9704626aa8832a3b4de5b27/raw/quotes.json')
  //   .then(response => {
  //     this.quotes = response.data.map((quote, index) => {
  //       const extras = {visable: true, id: index}
  //       if(index > 15) {
  //         extras.visable = false
  //       }
  //       return Object.assign(quote, extras)
  //     })
  //   })
  // },
// })
