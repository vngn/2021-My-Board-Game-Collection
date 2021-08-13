<?php

namespace App\Form;

use App\Entity\Jeu;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class JeuType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nom', null, ['label' => 'Nom*'])
            ->add('image',FileType::class, ['label' => 'Image', 'data_class' => null])
            ->add('image',FileType::class, ['label' => 'Image', 'data_class' => null, 'required' => false])            
            // ->add('image2')
            // ->add('image3')
            // ->add('image4')
            // ->add('image5')
            ->add('description', null, ['label' => 'Description'])
            ->add('langue', ChoiceType::class, ['label' => 'Langue', 'choices' => [
                '-' => '-',
                'Anglais' => 'Anglais',
                'Français' => 'Français',
            ],])
            ->add('editeur', null, ['label' => 'Editeur'])
            ->add('sortie', null, ['label' => 'Année de sortie'])
            ->add('categorie', null,["choice_label"=>"categorie", 'label' => 'Catégorie'])
            ->add('prix', null, ['label' => 'Prix'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Jeu::class,
        ]);
    }
}
