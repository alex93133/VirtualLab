import UIKit

class TheoryText: UIViewController {

    
    @IBOutlet weak var theoryTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    let attributedStringParagraphStyle = NSMutableParagraphStyle()
    attributedStringParagraphStyle.alignment = NSTextAlignment.left
    attributedStringParagraphStyle.lineSpacing = 4.0
    attributedStringParagraphStyle.paragraphSpacing = 15.0

    let attributedStringParagraphStyleOne = NSMutableParagraphStyle()
    attributedStringParagraphStyleOne.alignment = NSTextAlignment.left
    attributedStringParagraphStyleOne.lineSpacing = 4.0
    attributedStringParagraphStyleOne.paragraphSpacing = 5.0

    let attributedStringParagraphStyleTwo = NSMutableParagraphStyle()
    attributedStringParagraphStyleTwo.alignment = NSTextAlignment.left
    attributedStringParagraphStyleTwo.lineSpacing = 4.0
    attributedStringParagraphStyleTwo.paragraphSpacing = 15.0

    let attributedString = NSMutableAttributedString(string: "Ректификация - физический процесс разделения жидких смесей взаимно растворимых компонентов, различающихся температурами кипения.\nРектификацию осуществляют путем противоточного многократного контактирования неравновесных фаз более нагретой паровой фазы и жидкой фазы с меньшей температурой. При контактировании фаз протекает процесс тепломассообмена. По мере движения потоков в колонне происходят многократные частичные процессы конденсации паров и испарения жидкости. При этом низкокипящие компоненты переходят из жидкости в пар, а высококипящие - из пара в жидкость, т.е. паровая фаза обогащается низкокипящими компонентами, а жидкая - высококипящими. \nПроцесс ректификации осуществляют в ректификационных колоннах с контактными устройствами тарельчатого или насадочного типа. Для образования нисхо-дящего потока жидкости или флегмы (путем конденсации паров) на верху колонны отводят тепло, а для образования восходящего потока пара (частичным испарения жидкости) — в низ колонны подводят тепло. В колонне сверху получают ректификат, снизу — остаток. \nРектификационная установка представляет собой сложный агрегат, в котором колнны связаны с рядом вспомогательных аппаратов: кубами, кипятильниками, различными тепблообменниками, сепараторами и др. Трубопроводы, обслуживающие площадки и вспомогательное оборудование, крепятся к корпусу колонны. На колоннах монтируют контрольно-измерительные приборы для измерения давления, температуры, состава смеси. На линиях ввода и вывода жидкости обязательно устанавливают гидравлические патрубки. Ректификационные колонны можно классифицировать в зависимости от количества выделяемых компонентов – на простые и сложные. \nПростые колонны предназначены, как правило, для ректификации двухкомпонентных смесей. Для разделения многокомпонентных смесей при этом можно использовать ряд последовательно соединенных простых колонн, количество которых на единицу меньше числа выделяемых компонентов. \nСложные колонны позволяют разделить многокомпонентную смесь в одном аппарате; при этом помимо верхнего и нижнего продукта отбирают ряд боковых фракций по высоте колонны c получением соответствующих продуктов. \nПо конструкции колонны представляют вертикальные цилиндрические аппараты, внутри которых установлены контактные устройства (тарелки \nили насадки различных типов) и другие устройства, обеспечивающие работу аппарата. К основным элементам колонн относятся элементы корпуса (цилиндрический корпус, днища, опорную обечайку, присоединительные штуцера) и внутренние устройства (контактные массообменные устройства – тарелки, насадки, устройства для ввода сырья и орошения, отбойники и др.). \nПо конструкции корпусов различают в основном следующие типы колонн: \n- Корпус собран из отдельных царг, соединяемых между собой фланцами на прокладках. Крышку и днище крепят таким же способом. В таком корпусе \nне устраивают люки и лазы. Длина царги не более 2-2,5м, в каждой царге помещается 4-7 тарелок. \n- Корпус цельносварной. Крышку крепят с помощью фланцевого соединения. Для осмотра предусматривают смотровые люки. \n- Корпус цельносварной к нему приваривают крышку и днище. Обязательно снабжают \nлюками – лазами. \nВ случае, когда нагрузки по пару и жидкости значительно изменяются по высоте, корпус целесообразно выполнять ступенчатым. \nДиаметры колонны определяют в зависимости от производительности установки и скорости паров в колонне. В химической и нефтеперерабатывающей промышленности находят применение ректификационные колонны различных размеров: от небольших колонн диаметром 300 – 400 мм до крупнотоннажных высокопроизводительных установок с колоннами диаметром 6, 10 м и более. \nВысота колонны зависит от числа тарелок и расстояния между ними. Чем меньше расстояние между тарелками, тем ниже колонна. Однако при уменьшении расстояния между тарелками увеличивается унос брызг и возникает опасность переброса жидкости с нижних тарелок на верхние, что существенно уменьшает КПД установки. \nРасстояние между тарелками обычно принимают в зависимости от диаметра колонны с учетом возможности ремонта и чистки колонны. \nЧисло тарелок ректификационной колнны или высота насадки определяютсятехнологическим расчетом. Оно зависит от физико-химических свойств разделяемых компонентов.")

    attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name:"Montserrat-ExtraBold", size:17.0)!, range:NSMakeRange(0,14))
    attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont(name:"SFProDisplay-Regular", size:17.0)!, range:NSMakeRange(14,4203))
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyle, range:NSMakeRange(0,2696))
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleOne, range:NSMakeRange(2696,451))
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:attributedStringParagraphStyleTwo, range:NSMakeRange(3147,1070))
    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor(red:0.0, green:0.0, blue:0.0, alpha:1.0), range:NSMakeRange(0,4217))
        attributedString.addAttribute(NSAttributedString.Key.backgroundColor, value:UIColor(named: "BackgroundColor")!, range:NSMakeRange(0,4217))

    theoryTextLabel.attributedText = attributedString
    theoryTextLabel.backgroundColor = .clear
    theoryTextLabel.textColor = UIColor(named: "BlackTextColor")
    theoryTextLabel.numberOfLines = 0
    theoryTextLabel.sizeToFit()
  
}
}
