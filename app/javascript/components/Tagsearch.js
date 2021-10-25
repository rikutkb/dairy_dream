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
        return {name:json.name,label:json.name}
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
        <Select options={this.state.candidates}
        onInputChange={(keyword) => this.fetchTags(this.props.kind,keyword) }
        />
      </div>

    );
  }

}
Tagsearch.propTypes = {
  kind: PropTypes.number
}

export default Tagsearch
