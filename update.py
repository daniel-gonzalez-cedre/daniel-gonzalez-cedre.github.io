from datetime import datetime

def braille(char: str) -> str:
  char = str(char)
  match char:
    case '#':
      return '<font color="#b9a193">&#10300;</font>'
    case '.':
      return '<font color="#b9a193">&#10290;</font>'
    case '/':
      return '<font color="#b9a193">&#10296;&#10252;</font>'
    case '0':
      return '&#10266;'
    case '1':
      return '&#10241;'
    case '2':
      return '&#10243;'
    case '3':
      return '&#10249;'
    case '4':
      return '&#10265;'
    case '5':
      return '&#10257;'
    case '6':
      return '&#10251;'
    case '7':
      return '&#10267;'
    case '8':
      return '&#10259;'
    case '9':
      return '&#10250;'
    case _:
      raise AssertionError

def convert(string: str) -> str:
  return ''.join(map(braille, '#' + string))

if __name__ == '__main__':
  date: str = datetime.today().strftime('%Y.%m.%d')

  year = 2023
  month = 11
  day = 24

  filenames = ['index.html',
               'about-me.html',
               'research.html',
               'teaching/discrete-mathematics.html',
               'teaching/principles-of-computing.html']

  for filename in filenames:
    print(f'updating {filename} ...', end=' ')
    with open(filename, 'r+') as file:
      contents = file.read()
      line = contents.index('<!-- last update -->')
      file.seek(line+26)
      file.write(convert(date))
    print('done')
