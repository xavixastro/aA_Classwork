import React from 'react';

class BenchIndex extends React.Component {
    componentDidMount() {
        // request benches from your API here
        this.props.fetchBenches();
    }

    render() {
        return(
            <ul>
                {Object.values(this.props.benches).map(bench => <li>{bench.description}</li>)}
            </ul>
        )
    }
}

export default BenchIndex;