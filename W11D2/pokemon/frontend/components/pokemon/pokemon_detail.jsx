import React from 'react';

class PokemonDetail extends React.Component {

    componentDidMount(){
        this.props.requestPokemonDetail(this.props.match.params.pokemonId)
    }

    componentDidUpdate(prevProps){
        if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) {
            this.props.requestPokemonDetail(this.props.match.params.pokemonId)
        }
    }

    render () {
        
        if (this.props.pokemon === undefined) return null;

        return (
            <ul>
                <li>{this.props.pokemon.name}</li>
                <li>{this.props.pokemon.attack}</li>
                <li>{this.props.pokemon.defense}</li>
                <ul>
                    Items:
                    {Object.values(this.props.items).map(item => <li>{item.name}</li>)}
                </ul>
            </ul>
        )
    }
}

export default PokemonDetail;