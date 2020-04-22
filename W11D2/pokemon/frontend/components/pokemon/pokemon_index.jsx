import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { HashRouter, Route } from "react-router-dom";


 class PokemonIndex extends React.Component {

    constructor(props){
        super(props)
    }

    componentDidMount(){
        // debugger
        this.props.requestAllPokemon();
    }

     render(){
         return( 
             <div>
                <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
                <ul>
                    {/* {this.props.pokemon.map(pokemon => <li>Test</li>)} */}
                    {/* {this.props.pokemon.map((pokemon,idx) => <li key={idx}>{pokemon.name}<img src={pokemon.image_url} width="20" height="20"></img></li>)} */}
                    {this.props.pokemon.map((pokemon, idx) => <PokemonIndexItem key={idx} pokemon={pokemon}/>)}
                </ul>
             </div>
         )
     }
 }

 export default PokemonIndex;