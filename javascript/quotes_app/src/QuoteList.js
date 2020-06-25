Vue.component('quote-list', {
  props: ['quotes', 'viewStart', 'viewEnd'],
  template: `
    <div>
      <table>
        <tbody>
          <quote-item
            v-for='(quote, index) in quotes'
            v-bind:quote='quote'
            v-show='index >= viewStart && index <= viewEnd'
            v-bind:index='index'
            :key='quote.id'
          />
        </tbody>
      </table>
    </div>
  `
})
