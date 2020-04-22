export const fetchAllPokemon = () => {
    return $.ajax({
        url: '/api/pokemon', 
        method: 'GET'
    })
}

export const fetchPokemon = (pokeId) => {
    return $.ajax({
        url: `/api/pokemon/${pokeId}`,
        method: 'GET'
    })
}