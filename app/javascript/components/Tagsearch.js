import React,{useState, useEffect } from "react"
import PropTypes from "prop-types"
import Select from 'react-select'
import CreatableSelect from 'react-select/creatable';
import { thisExpression } from "@babel/types";

class Tagsearch extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      candidates: [],
      kind: this.props.kind
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
        candidates: candidates,
        kind: this.props.kind
      });
    })
    .catch(e=>{
    })
  }
  SelectedValue(kind){
    return this.props.tags.map(function(tag){
      if(tag.kind == kind){
        return {value:tag.name,label:tag.name};
      }
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
        defaultValue={()=>this.SelectedValue(this.props.kind)}
        />
      </div>
    );
  }

}
Tagsearch.propTypes = {
  kind: PropTypes.number,
  tags: PropTypes.array

}

export default Tagsearch
