function savepng( filename, width, height, h)
%savepdf( filename, width, height, h) resize figure and save to cropped pdf
%   filename    string with name of file to save as
%   width       int indicating number of inches for width.  defaults to 6.
%               if 0, keep width exactly as it is
%   height      int indicating number of inches for height.  defaults to 4
%               if 0, keep height exactly as it is
%   h           figure handle.  defaults to gcf.

if ~exist('width', 'var'); width = 800; end;
if ~exist('height', 'var'); height = 600; end;
if ~exist('h', 'var'); h = gcf; end;

set(gcf, 'Units', 'pixels');
p = get(gcf, 'Position');
if width==0;  width = p(3);  end;
if height==0; height = p(4); end;

% required to make pixel sized come out right;
normFactor = 3/5;
width = width * normFactor;
height = height * normFactor;

set(gcf, 'Position', [ 0, 0, width, height] )
set(gcf, 'PaperUnits', 'points'); 
set(gcf, 'PaperSize', [width height]);
set(gcf, 'PaperPositionMode', 'auto');

if exist(filename, 'file'); delete(filename); end
saveas(h, filename, 'png')

end