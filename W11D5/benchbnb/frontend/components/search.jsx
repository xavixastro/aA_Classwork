import React from 'react';
import BenchIndex from './bench_index';
import BenchMap from './bench_map';

class Search extends React.Component{

    constructor(props){
        super(props)
    }

    render(){
        return (
            <div>
                <BenchMap benches={this.props.benches}/>
                <BenchIndex benches={this.props.benches} fetchBenches={this.props.fetchBenches} />
            </div>
        )
    }
} 

export default Search;