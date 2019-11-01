import React from 'react';

import GiphysIndex from './giphys_index';


class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {searchTerm: ""};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({searchTerm: e.currentTarget.value});
  }
  
  handleSubmit(e) {
    e.preventDefault();
    const searchTerm = this.state.searchTerm;
    
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    let giphs = this.props.giphys;
    // console.log(giphs);
    // const poops = giphs.forEach(giph => {
    //   let url = giph.url; 
      
    // })
    return (
      <div>
      <form onSubmit={this.handleSubmit}>

        <input type="text" onChange={this.handleChange} value={this.state.searchTerm}></input>
        
        <button>SEARCH FOR GIF</button>
      </form>

      <GiphysIndex giphys={giphs}/>
      </div>
    )
  }
}

export default GiphysSearch;