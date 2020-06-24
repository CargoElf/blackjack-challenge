Vue.component('quote-list', {
  props: ['quotes'],
  template: `
    <div>
      <table>
        <tbody>
          <quote-item
            v-for='quote in quotes'
            v-bind:quote='quote'
          />
        </tbody>
      </table>
    </div>
  `
})
