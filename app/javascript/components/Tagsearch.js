import React,{useState, useEffect } from "react"
import PropTypes from "prop-types"
import Select from 'react-select'
import CreatableSelect from 'react-select/creatable';

class Tagsearch extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      candidates: []
    }
    this.fetchTags(this.props.kind,"")
  }

  fetchTags(kind,keyword){
    const params = {
      keyword:keyword,
      kind:kind
    };
    const query_params = new URLSearchParams(params); 
    fetch('/dream_app/tags/search?'+query_params,{
      method: 'GET',
      headers:{
       'Content-Type': 'application/json'
      }
    })
    .then(res => {
      return res.json();
    })
    .then(json=>{
      let candidates = json.map(json=>{
        return {value:json.name,label:json.name}
      });
      this.setState({
        candidates: candidates
      });
    })
    .catch(e=>{
    })
  }
  render () {
    return (
      <div>
        <CreatableSelect options={this.state.candidates}
        isMulti
        name="tags"
        isClearable
        className="basic-multi-select"
        classNamePrefix="select"
        />
      </div>
    );
  }

}
Tagsearch.propTypes = {
  kind: PropTypes.number
}

export default Tagsearch
