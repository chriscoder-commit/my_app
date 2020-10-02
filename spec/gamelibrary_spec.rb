require_relative '../lib/game_library'

describe 'game_library' do
  it 'if title in data, should return title' do
    # mock data
    game = {
      'title' => 'halo',
      'genre' => 'fps'
    }
    game_library = GameLibrary.new
    actual = game_library.find('halo')
    expect(actual).to eq(game)
  end

  it 'title not in data, should not return title' do
    game_library = GameLibrary.new
    actual = game_library.find('hello everyone')
    expect(actual).to eq(nil)
  end

  it 'should push a hash into an instance variable' do
    game_library = GameLibrary.new
    # mock data
    game = {
      'title' => 'test',
      'genre' => 'testing'
    }
    allow(game_library).to receive(:games_input) do
      # the games_input is the method where you get user input, i.e. ask for a title to add. below hard codes some values for that user input
      # for purpose of test
      game_library.genre = 'testing'
      game_library.entry = 'test'
    end
    game_library.add_title
    expect(game_library.user_games.last).to eq(game)
  end
end
