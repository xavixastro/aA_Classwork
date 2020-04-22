import {connect} from 'react-redux';
import PokemonDetail from './pokemon_detail';
import {requestPokemonDetail, requestAllPokemon} from '../../actions/pokemon_actions'


const mapStateToProps = (state, ownProps) => {
    // debugger
    let pokemon = state.entities.pokemon[ownProps.match.params.pokemonId];
    let items = state.entities.items;
    return {pokemon, items}
}


const mapDispatchToProps = (dispatch) => ({
    requestPokemonDetail: (pokeId) => dispatch(requestPokemonDetail(pokeId))
})

export default connect(
    mapStateToProps, 
    mapDispatchToProps
)(PokemonDetail);