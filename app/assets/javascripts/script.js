var taggle = new Taggle('example3');

taggle.add('one');
taggle.add(['two', 'three', 'four', 'four', 'five', 'five']);
taggle.remove('five');
taggle.remove('four', true);
