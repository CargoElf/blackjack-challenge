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
            :key='quote.id'
          />
        </tbody>
      </table>
    </div>
  `
})
