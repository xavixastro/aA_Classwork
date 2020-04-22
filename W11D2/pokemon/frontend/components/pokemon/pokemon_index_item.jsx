import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = ({pokemon}) => (
    <li>
        <Link to={`/pokemon/${pokemon.id}`}>
            {pokemon.name}
            <img src={pokemon.image_url} width="20" height="20"></img>
        </Link>
    </li>
)

export default PokemonIndexItem;