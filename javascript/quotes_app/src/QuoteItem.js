Vue.component('quote-item', {
  props: ['quote', 'index'],
  template: `
    <tr>
      <td>{{ quote.quote }}</td>
    </tr>
    `
})
