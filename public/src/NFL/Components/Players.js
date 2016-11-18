'use strict';

exports.showDate = function(datetime) {
  return new Date(datetime)
    .toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
};
