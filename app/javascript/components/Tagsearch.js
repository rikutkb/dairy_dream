import React from "react"
import PropTypes from "prop-types"
import Select from 'react-select'

class Tagsearch extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      candidates: []
    }
  }
  fetchTags(){
    fetch('/dream_app/tags/search',{
      method: 'GET',
      headers:{
       'Content-Type': 'application/json'
      }
    })
    .then(res => {
      console.log(res);
    }).catch(err=>{
      console.log(err);
    })
  }
  render () {
    return (
      <div>
        <Select options={this.state.candidate}
        onInputChange={this.fetchTags}
        />
        <h1>aaa</h1>
      </div>

    );
  }
}

export default Tagsearch
