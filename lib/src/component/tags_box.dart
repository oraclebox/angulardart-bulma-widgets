import 'package:angular2/angular2.dart';
import 'dart:html';

@Component(
    selector: 'tags-box',
    templateUrl: 'tags_box.html',
    directives: const [COMMON_DIRECTIVES]
)
class TagsBox implements OnInit, AfterViewInit {
  @Input()
  String tagClass;
  @Input()
  bool hasBorder;
  @Input()
  String placeholder;

  @ViewChild('tagPanel')
  ElementRef tagPanelRef;

  Set<String> tags = new Set();
  List<String> tagSequence = [];
  String tagVal;


  @override
  ngOnInit() {
    if (placeholder == null)
      placeholder = 'Add a tag ...';
  }

  @override
  ngAfterViewInit() {

  }

  onKeydown(event) {
    if (event.keyCode == 13) {
      if (tagVal != null && !tagVal.isEmpty && !tags.contains(tagVal)) {
        tags.add(tagVal);
        tagSequence.add(tagVal);
        updateStyle();
      }
      tagVal = '';
    } else if (event.keyCode == 8) {
      if(tagVal == null || tagVal.length <= 0) {
        tags.remove(tagSequence.last);
        tagSequence.removeLast();
      }
    }
  }

  onDeleteTag(event, tag) {
    if (tag != null && tag != '')
      tags.remove(tag);
    print(tag);
  }

  void updateStyle(){
    tagPanelRef.nativeElement.querySelectorAll('span').forEach((span) {
      if (tagClass != null) {
        print('span');
        span.classes.add(tagClass);
      }
    });
  }
}