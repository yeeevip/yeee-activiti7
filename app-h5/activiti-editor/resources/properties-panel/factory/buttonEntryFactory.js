'use strict';

var escapeHTML = require('../Utils').escapeHTML;

var entryFieldDescription = require('./EntryFieldDescription');

var bind = require('lodash/bind');

/**
 *
 * @param {Object} options
 * @param {String} options.id
 * @param {String} [options.label]
 * @param {Function} options.handleClick
 * @param {String} [options.description]
 *
 * @example
 *
 * var linkEntry = link({
 *   id: 'foo',
 *   description: 'Some Description',
 *   handleClick: function(element, node, event) { ... },
 *   showLink: function(element, node) { ... }
 * });
 *
 * @return {Entry} the newly created entry
 */
function button(options) {

  var id = options.id,
      label = options.label || id,
      handleClick = options.handleClick,
      description = options.description;

  if (typeof handleClick !== 'function') {
    throw new Error('options.handleClick must be a function');
  }

  var resource = {
    id: id
  };

  resource.html =
    '<div class="entry-button" id="entry-button-click">' + escapeHTML(label) + '</div>';

  // add description below button entry field
  if (description) {
    resource.html += entryFieldDescription(description);
  }

  // resource.handleClick = bind(handleClick, resource);

  return resource;
}

module.exports = button;
