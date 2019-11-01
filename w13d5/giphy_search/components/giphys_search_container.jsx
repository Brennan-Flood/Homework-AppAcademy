import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchSearchGiphys, receiveSearchGiphys } from '../actions/giphy_actions';

const mapStateToProps = state => ({
  giphys: state.giphys
});

const mapDispatchToProps = dispatch => {
  return { 
    fetchSearchGiphys: (searchTerm) => dispatch(fetchSearchGiphys(searchTerm))
    // receiveSearchGiphys: () => dispatch(receiveSearchGiphys()) 
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(GiphysSearch);
