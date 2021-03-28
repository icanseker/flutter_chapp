import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/blueprint/multi_channel_conversation.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/blueprint/text_message.dart';

SingleChannelConversation _c1 = SingleChannelConversation(
  conId: 'c1',
  personId: 'einstein',
)
    .addMessage(
      IncomingMessage(
        TextMessage(
          text:
              'Physics, science that deals with the structure of matter and the interactions between the fundamental constituents of the observable universe.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-13 23:32:34.612152'))
          .setReadTime(DateTime.parse('2021-03-13 23:34:36.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'In the broadest sense?'))
          .setSentTime(DateTime.parse('2021-03-14 00:02:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-14 00:02:67.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:03:23.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
          text:
              'Concerned with all aspects of nature on both the macroscopic and submicroscopic levels.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 00:14:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:24:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
          text:
              'Its scope of study encompasses not only the behaviour of objects under the action of given forces but also the nature and origin of gravitational, electromagnetic, and nuclear force fields.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 00:15:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:24:22.612152')),
    )
    .addMessage(
      OutgoingMessage(
        TextMessage(
          text:
              'So, its ultimate objective is the formulation of a few comprehensive principles that bring together and explain all such disparate phenomena.',
        ),
      )
          .setSentTime(DateTime.parse('2021-03-14 00:26:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-14 00:27:12.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:34:23.612152')),
    )
    .addMessage(
      IncomingMessage(TextMessage(text: 'That\'s correct !'))
          .setReceivedTime(DateTime.parse('2021-03-14 01:26:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:34:22.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
            text:
                'The three laws of motion set forth by Isaac Newton form the foundation of classical mechanics, together with the recognition that forces are directed quantities (vectors) and combine accordingly. The first law, also called the law of inertia, states that, unless acted upon by an external force, an object at rest remains at rest, or if in motion, it continues to move in a straight line with constant speed. Uniform motion therefore does not require a cause. Accordingly, mechanics concentrates not on motion as such but on the change in the state of motion of an object that results from the net force acting upon it. Newton’s second law equates the net force on an object to the rate of change of its momentum, the latter being the product of the mass of a body and its velocity. Newton’s third law, that of action and reaction, states that when two particles interact, the forces each exerts on the other are equal in magnitude and opposite in direction. Taken together, these mechanical laws in principle permit the determination of the future motions of a set of particles, providing their state of motion is known at some instant, as well as the forces that act between them and upon them from the outside. From this deterministic character of the laws of classical mechanics, profound (and probably incorrect) philosophical conclusions have been drawn in the past and even applied to human history.'),
      )
          .setReceivedTime(DateTime.parse('2021-03-24 11:26:34.612152'))
          .setReadTime(DateTime.parse('2021-03-24 11:34:22.612152')),
    )
    .addMessage(
      OutgoingMessage(TextMessage(text: 'Why does physics work in SI units?'))
          .setSentTime(DateTime.parse('2021-03-25 01:36:34.612152')),
    );

SingleChannelConversation _c2 = SingleChannelConversation(
  conId: 'c2',
  personId: 'curie',
)
    .addMessage(
      IncomingMessage(TextMessage(text: 'Are you there?'))
          .setReceivedTime(DateTime.parse('2021-03-21 18:00:34.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(
          text:
              'The ultimate aim of physics is to find a unified set of laws governing matter, motion, and energy at small (microscopic) subatomic distances, at the human (macroscopic) scale of everyday life, and out to the largest distances',
        ),
      ).setReceivedTime(DateTime.parse('2021-03-21 18:03:34.612152')),
    )
    .addMessage(
      IncomingMessage(
        TextMessage(text: 'e.g., those on the extragalactic scale'),
      ).setReceivedTime(DateTime.parse('2021-03-21 18:05:34.612152')),
    );

MultiChannelConversation _c3 = MultiChannelConversation(
  conId: 'c3',
  groupId: 'g1',
)
    .addMessage(
      message: OutgoingMessage(TextMessage(text: 'What is physics?'))
          .setSentTime(DateTime.parse('2021-03-14 00:26:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-14 00:27:12.612152'))
          .setReadTime(DateTime.parse('2021-03-14 00:34:23.612152')),
    )
    .addMessage(
      personId: 'einstein',
      message: IncomingMessage(
        TextMessage(text: 'Physics is the basic physical science !'),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:26:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:34:22.612152')),
    )
    .addMessage(
      personId: 'tesla',
      message: IncomingMessage(
        TextMessage(
          text:
              'Until rather recent times physics and natural philosophy were used interchangeably for the science whose aim is the discovery and formulation of the fundamental laws of nature.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:28:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:34:22.612152')),
    )
    .addMessage(
      personId: 'curie',
      message: IncomingMessage(
        TextMessage(
          text:
              'As the modern sciences developed and became increasingly specialized, physics came to denote that part of physical science not included in astronomy, chemistry, geology, and engineering.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:29:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:34:22.612152')),
    )
    .addMessage(
      message: OutgoingMessage(TextMessage(text: 'What is mechanics?'))
          .setSentTime(DateTime.parse('2021-03-14 01:35:34.612152'))
          .setDeliveredTime(DateTime.parse('2021-03-14 01:36:12.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:38:23.612152')),
    )
    .addMessage(
      personId: 'curie',
      message: IncomingMessage(
        TextMessage(
          text:
              'Mechanics is generally taken to mean the study of the motion of objects (or their lack of motion) under the action of given forces. Classical mechanics is sometimes considered a branch of applied mathematics. It consists of kinematics, the description of motion, and dynamics, the study of the action of forces in producing either motion or static equilibrium (the latter constituting the science of statics).',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:39:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:40:22.612152')),
    )
    .addMessage(
      personId: 'newton',
      message: IncomingMessage(
        TextMessage(
          text:
              'The 20th-century subjects of quantum mechanics, crucial to treating the structure of matter, subatomic particles, superfluidity, superconductivity, neutron stars, and other major phenomena, and relativistic mechanics, important when speeds approach that of light, are forms of mechanics that will be discussed later in this section.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:40:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:42:22.612152')),
    )
    .addMessage(
      personId: 'newton',
      message: IncomingMessage(
        TextMessage(
          text:
              'In classical mechanics the laws are initially formulated for point particles in which the dimensions, shapes, and other intrinsic properties of bodies are ignored. Thus in the first approximation even objects as large as Earth and the Sun are treated as pointlike.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:42:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:43:22.612152')),
    )
    .addMessage(
      personId: 'newton',
      message: IncomingMessage(
        TextMessage(
          text: 'e.g., in calculating planetary orbital motion',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:44:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:45:22.612152')),
    )
    .addMessage(
      personId: 'edison',
      message: IncomingMessage(
        TextMessage(
          text:
              'In rigid-body dynamics, the extension of bodies and their mass distributions are considered as well, but they are imagined to be incapable of deformation.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:46:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:48:22.612152')),
    )
    .addMessage(
      personId: 'edison',
      message: IncomingMessage(
        TextMessage(
          text:
              'The mechanics of deformable solids is elasticity; hydrostatics and hydrodynamics treat, respectively, fluids at rest and in motion.',
        ),
      )
          .setReceivedTime(DateTime.parse('2021-03-14 01:47:34.612152'))
          .setReadTime(DateTime.parse('2021-03-14 01:48:22.612152')),
    );

SingleChannelConversation _c4 = SingleChannelConversation(
  conId: 'c4',
  personId: 'tesla',
)
    .addMessage(
      OutgoingMessage(
        TextMessage(
            text: 'What happens in the gray zone between solid and liquid?'),
      )
          .setCreatedTime(DateTime.parse('2021-03-28 00:04:34.612152'))
          .sendingErrorOccurred(),
    )
    .addMessage(
      OutgoingMessage(
        TextMessage(
            text: 'What happens in the gray zone between solid and liquid?'),
      ).setCreatedTime(DateTime.parse('2021-03-28 00:04:34.612152')),
    );

Map<String, Conversation> globalConversationList = {
  'c1': _c1,
  'c2': _c2,
  'c3': _c3,
  'c4': _c4,
};
