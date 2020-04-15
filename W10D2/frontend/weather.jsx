import React from 'react'

export default class Weather extends React.Component{
    constructor(props){
        super(props)
        this.state({
            weather: 0
        })
        this.getWeather = this.getWeather.bind(this)
    }

    getWeather(){

    }

}