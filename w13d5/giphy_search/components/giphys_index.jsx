import React from 'react';

import GiphysIndexItem from './giphys_index_item';


class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const poops = this.props.giphys.map((giph, i) => {
      let url = giph.url;
      console.log(giph.url);
      return (
        <li key={i}><img src={url} /></li>
      )
    })
    return (
      <ul>
        {poops}
      </ul>
    )
  }
}

export default GiphysIndex;